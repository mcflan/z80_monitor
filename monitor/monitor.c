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

void view(uint8_t cdev, uint16_t start, uint16_t count)
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
            cdev_put(cdev, ' ');
            print_addr(cdev, addr);
            cdev_put(cdev, ' ');
        }
        write_address(addr);
        uint8_t x = read_data();
        cdev_put(cdev, hexchars[x >> 4]);
        cdev_put(cdev, hexchars[x & 0xf]);
        ascii[addr & 0xf] = (isprint(x)) ? x : ' ';
        cdev_put(cdev, ' ');
        // Print ASCII chars and start new line after 16 data bytes
        if ((addr & 0xf) == 0xf) {
            cdev_write(cdev, (uint8_t *)ascii, 16);
            cdev_put(cdev, '\n');
            cdev_put(cdev, '\r');
        }
        addr++;
    }
}

typedef struct mon_s {
    uint16_t addr;
    uint8_t bus_claimed;
    uint8_t view_on;
    uint8_t inc_addr;
    uint8_t mem_type;
} mon_t;

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

void cmd_line(mon_t *mon, char c)
{
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
    }
    update_hardware(mon);
}


static void main_loop(mon_t *mon)
{
    uint8_t cdevs = (1 << EXT_CDEV);

    mon->inc_addr = 0;
    mon->bus_claimed = 0;
    mon->view_on = 1;
    mon->mem_type = 0; // Default to main memory
    update_hardware(mon);
    //claim_bus();
    //_delay_us(1);
    //code2();
    while (1) {
        // Sleep for 100ms or until data arrives on UART. Timer mode
        // "CLOCK" ensures we refresh regularly.
        uint8_t events = poll(cdevs, 100, TIMER_MODE_CLOCK);
        if (events & 0x80) { // timer elapsed
            if (mon->view_on && mon->bus_claimed) {
                move_cursor(EXT_CDEV, 4, 1);
                printf("\e[?25l");
                view(EXT_CDEV, mon->addr, 256);
                move_cursor(EXT_CDEV, 22, 1);
                printf("\e[?25h");
            }
        }
        if (events & (1 << EXT_CDEV)) { // got a serial character
            char c = cdev_get(EXT_CDEV);

            // Echo characters
            cdev_put(EXT_CDEV, c);
            //printf("0x%02X\n\r", c);
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
