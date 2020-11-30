/*
 * Z80 Monitor board driver
 *
 * (C) Copyright James L Macfarlane, Airborne Engineering Ltd 2020.
 */

#include "board.h"

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/cpufunc.h>

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <math.h>

#include "uart.h"
#include "timer.h"
#include "debug.h"
#include "hexify.h"
#include "poll.h"
#include "monitor.h"

hexify_encoder_t henc;
hexify_decoder_t hdec;

#if defined(GIT_VERSION) && defined(GIT_DATE)
/* Version message */
    #define VERSION_MSG  "# Firmware git hash " GIT_VERSION " " GIT_DATE " Build " __DATE__ " " __TIME__ "\n\n\r"
#else
    #error "GIT_VERSION and/or GIT_DATE not defined."
#endif

#ifdef DEBUG
    uint8_t debug_lvl = 1;
#endif


/*
 * Sleep a number of seconds using interrupt-driven timer.
 */
void wait(float t)
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

typedef struct mon_s {
    uint16_t addr;
    uint8_t bus_claimed;
    uint8_t view_on;
    uint8_t inc_addr;
    uint8_t mem_type;
    int cmd;
    int count;
    int buf_ptr;
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

static void set_memtype(uint8_t memtype)
{
    if (memtype == 0) write_control(~CTRL_MREQ);
    if (memtype == 1) write_control(~CTRL_IORQ);
}

void mon_init(mon_t *mon)
{
    mon->inc_addr = 0;
    mon->bus_claimed = 0;
    mon->mem_type = 0; // Default to main memory
    mon->buf_ptr = 0;
}

void do_msg(mon_t *mon, uint8_t type, int len, uint8_t *data)
{
    switch (type) {
        case MSG_WR: {
            // type(1), memtype(1), address(2), data(N), checksum(1)
            int size = len - 3;
            if (size < 0) {
                printf("# Not enough bytes (%d) for message type %d\n", len, type);
                break;
            }
            uint8_t memtype = data[0];
            set_memtype(memtype);
            uint16_t addr = data[1] | (data[2] << 8);
            printf("# Writing %2d bytes at 0x%04X\n", size, addr);
            write_block(addr, data+3, size);
            // TODO: read block to verify it
            break;
         }
        case MSG_BUS_ACK:
            printf("# Acquire bus\n");
            claim_bus();
            break;
        case MSG_BUS_REL:
            printf("# Release bus\n");
            release_bus();
            break;
        default:
            printf("# Don't know about msg type %2d\n", type);
    }
}

#define MSG_BUF_SIZE     (64)
static uint8_t msgbuf[MSG_BUF_SIZE];

static void main_loop(mon_t *mon)
{
    mon_init(mon);
    update_hardware(mon);
    hexify_recvr_init(&hdec, msgbuf, MSG_BUF_SIZE);
    // Wait for a message to arrive then process it
    while (1) {
        uint8_t type;
        int len;
        char c = cdev_get(EXT_CDEV);
        int ret = hexify_recvr_next(&hdec, c, &type, &len);
        if (ret == 0) {
            do_msg(mon, type, len, msgbuf);
        }
        if (ret < 0) {
            printf("# Hex encoding error %d\n", ret);
        }
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
    PRINT("MCU Monitor. J.Macfarlane 2020\n\r");
    PRINT(VERSION_MSG);

    //hexify_recvr_init(&decoder, (uint8_t *)&rx_msg, XBEE_MSG_LEN);

    release_bus();

    main_loop(&mon);

    return 0;
}
