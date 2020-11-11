/*
 * Z80 Monitor board driver
 *
 * (C) Copyright James L Macfarlane, Airborne Engineering Ltd 2020.
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <math.h>

#include "board.h"
#include "uart.h"
#include "timer.h"
#include "debug.h"
#include "hexify.h"
#include "poll.h"

#include <util/delay.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/cpufunc.h>

#ifdef TESTMODE 
#warning "***************** THIS BUILD IS IN TEST MODE ********************"
#endif

/* Version message */
#define VERSION_MSG  "# Firmware git hash " GIT_VERSION " " GIT_DATE " Build " __DATE__ " " __TIME__ "\n\n\r"

#ifdef DEBUG
    uint8_t debug_lvl = 1;
#endif


/*
 * Sleep a number of seconds using interrupt-driven timer.
 */
static void wait(float t)
{
    timer_start(ST_WAIT, TIMER_MODE_ONESHOT, RATE(t));
    timer_sleep(ST_WAIT);
}

hexify_decoder_t decoder;


static inline void set_reg_addr(uint8_t x)
{
    PORTC &= ~0x03;
    PORTC |= x & 0x03;
    _NOP(); _NOP(); _NOP(); _NOP();
}

static inline void write(uint8_t x)
{
    DDRD = 0xfc;
    DDRB = 0x03;
    PORTD = x;
    PORTB = x & 3;
    PORTC &= ~NX_WR; // Assert write line
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP();
    PORTC |= NX_WR; // De-assert write line
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP();
}

static inline void write_reg(uint8_t reg_addr, uint8_t x)
{
    set_reg_addr(reg_addr);
    write(x);
}

static inline void write_control(uint8_t x)
{
    write_reg(REG_CONTROL, x);
}

static inline void write_address(uint16_t x)
{
    write_reg(REG_ADDR_L, x & 0xff);
    write_reg(REG_ADDR_H, x >> 8);
}

static inline void write_data(uint8_t x)
{
    write_reg(REG_DATA, x);
}

static inline uint8_t read_data(void)
{
    // Set port direction to input
    DDRD = 0;
    DDRB = 0;
    PORTC &= ~NX_RD; // Assert read line
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP();
    uint8_t x = (PIND & 0xfc) | (PINB & 0x03);
    PORTC |= NX_RD; // De-assert read line
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP();
    return x;
}

static inline void claim_bus(void)
{

    PORTC &= ~NX_BUSRQ; // Assert bus request line
}


static inline void release_bus(void)
{
    PORTC |= NX_BUSRQ; // De-assert bus request line
}


static inline void write_block(uint16_t addr, uint8_t *data, int size)
{
    int i;
    for (i = 0; i < size; i++) {
        write_address(addr++);
        write_data(data[i]);
    }
}

static const char hexchars[] = "0123456789ABCDEF";

void move_cursor(uint8_t cdev, int x, int y)
{
    printf("\e[%d;%dH", x, y);
}

void clear_screen(uint8_t cdev)
{
    printf("\e[2J");
}

void print_addr(uint8_t cdev, uint16_t addr)
{
    cdev_put(cdev, hexchars[(addr >> 12) & 0xf]);
    cdev_put(cdev, hexchars[(addr >>  8) & 0xf]);
    cdev_put(cdev, hexchars[(addr >>  4) & 0xf]);
    cdev_put(cdev, hexchars[(addr >>  0) & 0xf]);
}

void view(uint8_t cdev, uint16_t start, uint16_t count, uint16_t cursor)
{
    // Round start address down to nearest multiple of 16
    start &= 0xfff0;
    // Round count up to nearest multiple of 16
    if ((count & 0xf) > 0) {
       count = (count & 0xfff0) + 16;
    } 

    uint16_t addr = start;
    int i;
    for (i = 0; i < count; i++) {
        char ascii[16];

        if ((addr & 0xf) == 0) {
            // Print address at start of line
            print_addr(cdev, addr);
            cdev_put(cdev, ' ');
            cdev_put(cdev, ' ');
            if (addr == cursor) {
                cdev_put(cdev, '[');
            } else {
                cdev_put(cdev, ' ');
            }
        }
        write_address(addr);
        uint8_t x = read_data();
        cdev_put(cdev, hexchars[x >> 4]);
        cdev_put(cdev, hexchars[x & 0xf]);
        ascii[addr & 0xf] = (isprint(x)) ? x : ' ';
        if (addr+1 == cursor && (addr & 0xf) != 0xf) {
            cdev_put(cdev, '[');
        } else if (addr == cursor) {
            cdev_put(cdev, ']');
        } else {
            cdev_put(cdev, ' ');
        }
        // Print ASCII chars and start new line after 16 data bytes
        if ((addr & 0xf) == 0xf) {
            cdev_put(cdev, ' ');
            cdev_put(cdev, ' ');
            cdev_write(cdev, (uint8_t *)ascii, 16);
            cdev_put(cdev, '\n');
            cdev_put(cdev, '\r');
        }
        addr++;
    }
}

#define MON_MAX_COUNT_STR_LEN   (8)

#define IHEX_MAX_DATA           (32)
#define IHEX_MAX_DIGITS         (4)

typedef struct ihex_s {
    uint8_t data_buf[IHEX_MAX_DATA];
    uint16_t addr;
    char digit_buf[IHEX_MAX_DIGITS+1];
    uint8_t state;
    uint8_t digit_ptr;
    uint8_t digits_required;
    uint8_t count;
    uint8_t type;
    uint8_t data_ptr;
    uint8_t chksum;
} ihex_t;

enum {
   IHEX_START = 0,
   IHEX_COUNT,
   IHEX_ADDR,
   IHEX_TYPE,
   IHEX_DATA,
   IHEX_CHKSUM,
   IHEX_END,
   IHEX_DONE,
   IHEX_ERR,
};

void ihex_init(ihex_t *ihex)
{
    ihex->state = IHEX_START;
}

int ihex_value(ihex_t *ihex, uint16_t value)
{
    uint8_t i;
    for (i = 0; i < ihex->digits_required; i+=2) {
        ihex->chksum += (value >> (i*4)) & 0xff;
    }
    switch (ihex->state) {
        case IHEX_COUNT:
            ihex->count = value;
            ihex->state = IHEX_ADDR;
            ihex->digits_required = 4;
            break;
        case IHEX_ADDR:
            ihex->addr = value;
            ihex->state = IHEX_TYPE;
            ihex->digits_required = 2;
            break;
        case IHEX_TYPE:
            ihex->type = value;
            if (ihex->type > 5) {
                printf("Intel hex invalid type %d\r\n", ihex->type);
                ihex->state = IHEX_ERR;
                return -1;
            }
            ihex->data_ptr = 0;
            ihex->digits_required = 2;
            if (ihex->count > 0) {
                ihex->state = IHEX_DATA;
            } else {
                ihex->state = IHEX_CHKSUM;
            }
            break;
        case IHEX_DATA:
            ihex->data_buf[ihex->data_ptr++] = value;
            if (ihex->data_ptr >= ihex->count) {
                ihex->state = IHEX_CHKSUM;
                ihex->digits_required = 2;
            }
            break;
        case IHEX_CHKSUM:
            if (ihex->chksum != 0) {
                printf("Intel hex checksum error.\r\n");
                ihex->state = IHEX_ERR;
                return -1;
            }
            ihex->state = IHEX_END;
            break;
        default:
            printf("Intel hex invalid state (internal error).\r\n");
            ihex->state = IHEX_ERR;
            return -1;
    }
    return 0;
}

// Collect hex digits, turn them into values and feed them
// to ihex_value().
int ihex_char(ihex_t *ihex, char c)
{
    if (ihex->state == IHEX_START) {
        if (c == ':') {
            ihex->state = IHEX_COUNT;
            ihex->digits_required = 2;
            ihex->digit_ptr = 0;
        }
    } else if (ihex->state > IHEX_START && ihex->state < IHEX_END) {
        if (!isxdigit(c)) {
            printf("Intel hex parse error. Got non-hex digit 0x%02X\r\n", c);
            ihex->state = IHEX_ERR;
            return -1;
        }
        ihex->digit_buf[ihex->digit_ptr++] = c;
        if (ihex->digit_ptr >= ihex->digits_required) {
            ihex->digit_buf[ihex->digit_ptr] = 0;
            char *endptr;
            // This shouldn't fail, due to preceding checks.
            uint16_t value = strtol(ihex->digit_buf, &endptr, 16);
            if (endptr == ihex->digit_buf) {
                printf("Intel hex parse error for string %s'\r\n", ihex->digit_buf);
                ihex->state = IHEX_ERR;
                return -1;
            }
            ihex->digit_ptr = 0;
            ihex_value(ihex, value);
        }
    } else if (ihex->state == IHEX_END) {
        if (c != '\r' && c != '\n') {
            printf("Intel hex parse error. Expected \\n, got \'%c\'\r\n", c);
            ihex->state = IHEX_ERR;
            return -1;
        }
        ihex->state = IHEX_DONE;
        return 1; // Indicate to caller that we have a valid ihex record.

    } else {
        printf("Intel hex parser started in invalid state.\r\n");
        ihex->state = IHEX_ERR;
        return -1;
    }
    return 0;
}

typedef struct mon_s {
    uint16_t addr;
    uint8_t bus_claimed;
    uint8_t view_on;
    uint8_t inc_addr;
    uint8_t mem_type;
    int cmd;
    int count;
    char count_str[MON_MAX_COUNT_STR_LEN+1];
    int count_str_ptr;
    ihex_t *ihex;
} mon_t;

void mon_do_count_char(mon_t *mon, char c)
{
    if (isdigit(c)) {
        if (mon->count_str_ptr >= MON_MAX_COUNT_STR_LEN) {
            mon->count = 1;
            printf("Error: count too large\n");
            return;
        }
        // Append to count string
        mon->count_str[mon->count_str_ptr++] = c;
    } else {
        // If we haven't started a count, then default to 1 and bail
        // (this will happen if user doesn't include a count at all.)
        if (mon->count_str_ptr == 0) {
            mon->count = 1;
            return;
        }
        // Convert count string to int
        mon->count_str[mon->count_str_ptr] = 0;
        char *endptr;
        mon->count = strtol(mon->count_str, &endptr, 10);
        // Default to count of 1 if we can't parse count string
        if (endptr == mon->count_str) {
            mon->count = 1;
            printf("Error: can't parse count %s as a decimal number\n", mon->count_str);
        }
        // Reset count ptr ready for next count.
        mon->count_str_ptr = 0;
    }
}

void update_hardware(mon_t *mon)
{
    if (mon->bus_claimed) {
        claim_bus();
    } else {
        release_bus();
    }
    if (mon->mem_type == 0) write_control(~CTRL_MREQ);
    if (mon->mem_type == 1) write_control(~CTRL_IORQ);

}

void do_ihex_record(mon_t *mon)
{
    //printf("\rIntel Hex record type %d, count %d, address 0x%04X\n", mon->ihex->type, mon->ihex->count, mon->ihex->addr);
    if (mon->ihex->type == 0) {
        write_block(mon->ihex->addr, mon->ihex->data_buf, mon->ihex->count);
    }
}

void cmd_line(mon_t *mon, char c)
{

    if (mon->cmd == 0) {
        // Allow cmd to be prefixed with a decimal count.
        // Not all cmds will take notice of the count.
        mon_do_count_char(mon, c);
        switch (c) {
            case 'l': mon->addr++; break;
            case 'h': mon->addr--; break;
            case 'k': mon->addr-=16; break;
            case 'j': mon->addr+=16; break;
            case 'L': mon->addr-=256; break;
            case 'H': mon->addr+=256; break;
            case 'K': mon->addr-=4096; break;
            case 'J': mon->addr+=4096; break;
            case 'b': mon->bus_claimed=1; break;
            case 'B': mon->bus_claimed=0; break;
            case 'v': mon->view_on=1; break;
            case 'V': mon->view_on=0; break;
            case 'i': mon->inc_addr=1; break;
            case 'I': mon->inc_addr=0; break;
            case 'm': mon->mem_type=0; break;
            case 'M': mon->mem_type=1; break;
            case ':': mon->cmd = c; ihex_init(mon->ihex); ihex_char(mon->ihex, c); break;
        }
    } else {
        // All the functions below will reset mon->cmd to 0 when done.
        switch (mon->cmd) {
            case ':': {
                int ret = ihex_char(mon->ihex, c);
                if (ret != 0) {
                    mon->cmd = 0;
                }
                if (ret > 0 ) {
                    do_ihex_record(mon);
                }
                break;
            }
        }
    }
    update_hardware(mon);
}

ihex_t ihex;

void mon_init(mon_t *mon)
{
    mon->inc_addr = 0;
    mon->bus_claimed = 0;
    mon->view_on = 1;
    mon->mem_type = 0; // Default to main memory
    mon->count_str_ptr = 0;
    mon->ihex = &ihex;
    ihex_init(mon->ihex);
}

static void main_loop(mon_t *mon)
{
    uint8_t cdevs = (1 << EXT_CDEV);

    mon_init(mon);
    update_hardware(mon);
    //claim_bus();
    //_delay_us(1);
    //code2();
    move_cursor(EXT_CDEV, 22, 1);
    while (1) {
        // Sleep for 100ms or until data arrives on UART. Timer mode
        // "CLOCK" ensures we refresh regularly.
        uint8_t events = poll(cdevs, 100, TIMER_MODE_CLOCK);
        if (events & 0x80) { // timer elapsed
            if (mon->view_on) {
                printf("\e7");
                printf("\e[?25l");
                move_cursor(EXT_CDEV, 4, 1);
                claim_bus();
                view(EXT_CDEV, mon->addr-128, 256, mon->addr);
                if (!mon->bus_claimed) release_bus();
                printf("\e8");
                printf("\e[?25h");
            }
        }
        if (events & (1 << EXT_CDEV)) { // got a serial character
            char c = cdev_get(EXT_CDEV);

            // Echo characters
            cdev_put(EXT_CDEV, c);
            //printf("<0x%02X>\n\r", c);
            cmd_line(mon, c);
        }

        //release_bus();
        //wait(0.01);
        //claim_bus();
        //write_control(0xfb); // Assert /MREQ
        //dump(0x0000);
    }
}

static mon_t mon;

int main(void)
{
    /*
     * XD[7:2] => PD[7..2], tri-state
     * (PD1 an PD0 used for serial I/F)
     * XD[1..0] => PB[1..], tri-state
     * XA[1..0] => PC[1..0], output
     * /X_RD => PC2, output
     * /X_WR => PC3, output
     * /X_BUSRQ => PC4, output
     *
     * Address map:
     * 0: Write data
     * 1: Address latch A[7..0]
     * 2: Address latch A[15..8]
     * 3: Control register:
     *      Bit 0: !EPROM_EN
     *      Bit 1: !PGM_EN
     *      Bit 2: !MREQ
     *      Bit 3: !IOREQ
     */

    DDRD = 0xff; // Start as all inputs
    DDRB = 0x03;
    DDRC = 0x1f;
    // Start with control outputs de-asserted (high)
    PORTC |= NX_BUSRQ | NX_WR | NX_RD;

    timer_init(TIMER1_RELOAD);

    /* turn on global interrupts */
    sei();

    uart0_init(EXT_CDEV, 8); /* 115200 baud */
    stdout = &uart0_fp;

    cdev_put(EXT_CDEV, '\n');
    cdev_put(EXT_CDEV, '\r');
    clear_screen(EXT_CDEV);
    move_cursor(EXT_CDEV, 1, 1);
    PRINT("MCU Monitor. J.Macfarlane 2020\n\r");
    PRINT(VERSION_MSG);

    //hexify_recvr_init(&decoder, (uint8_t *)&rx_msg, XBEE_MSG_LEN);

    release_bus();

    main_loop(&mon);

    return 0;
}
