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

#include <stdbool.h>
#include <stdint.h>
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

void set_reset(bool state);
void set_INT(bool state);
void set_NMI(bool state);
void set_BUSRQ(bool state);
void bus_enable(bool state);

led_t leds[LEDS_NUMOF] = {
    [COMS_LED] = { .port = &LED_PORT, .pin = COMS_LED_PIN },
};

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

static inline void write_cycle(uint16_t addr, uint8_t memtype, uint8_t data)
{
    // Set-up address and data lines
    DA_DDR = 0xff;  // Enable data lines
    AL_PORT = addr & 0xff;
    AH_PORT = addr >> 8;
    DA_PORT = data;
    _NOP(); _NOP();
    // Set handshake lines
    if (memtype == MEM_TYPE_IO) {
        CTRL_PORT = MREQ | RD | M1 | RESET; // IORQ & WR low
    } else {
        CTRL_PORT = IORQ | RD | M1 | RESET; // MREQ & WR low
    }
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); // Approx 0.5us
    CTRL_PORT = IORQ | MREQ | RD | WR | M1 | RESET; // De-assert everything
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); // Approx 0.5us
    DA_DDR = 0x00;  // Disable data lines
}

static inline uint8_t read_cycle(uint16_t addr, uint8_t memtype)
{
    // Set-up address lines
    DA_DDR = 0x00;  // Ensure data port dir is in
    AL_PORT = addr & 0xff;
    AH_PORT = addr >> 8;
    _NOP(); _NOP();
    // Set handshake lines
    if (memtype == MEM_TYPE_IO) {
        CTRL_PORT = MREQ | WR | M1 | RESET; // IORQ & RD low
    } else {
        CTRL_PORT = IORQ | WR | M1 | RESET; // MREQ & RD low
    }
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); // Approx 0.5us
    uint8_t x = DA_PIN; // Read data bus
    CTRL_PORT = IORQ | MREQ | RD | WR | M1 | RESET; // De-assert everything
    _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); _NOP(); // Approx 0.5us
    return x;
}

static inline void write_block(uint16_t addr, uint8_t memtype, uint8_t *data, int size)
{
    int i;
    for (i = 0; i < size; i++) {
        write_cycle(addr++, memtype, data[i]);
    }
}

static inline void read_block(uint16_t addr, uint8_t memtype, uint8_t *data, int size)
{
    int i;
    for (i = 0; i < size; i++) {
        data[i] = read_cycle(addr++, memtype);
    }
}

typedef struct mon_s {
    uint16_t addr;
    uint8_t bus_claimed;
    uint8_t view_on;
    uint8_t mem_type;
    int cmd;
    int count;
    int buf_ptr;
} mon_t;

void mon_init(mon_t *mon)
{
    mon->bus_claimed = 0;
    mon->mem_type = 0; // Default to main memory
    mon->buf_ptr = 0;
}

#define RD_BUF_SIZE     (32)
static uint8_t rd_buf[RD_BUF_SIZE];

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
            uint16_t addr = data[1] | (data[2] << 8);
            printf("# Writing %2d bytes at 0x%04X - ", size, addr);
            write_block(addr, memtype, data+3, size);
            read_block(addr, memtype, rd_buf, size);
            int i;
            for (i = 0; i < size; i++) {
                if ((data+3)[i] != rd_buf[i]) break;
            }
            if (i < size) {
                printf("Error at 0x%04X\n", addr+i);
            } else {
                printf("ok\n");
            }
            break;
        }
        case MSG_RD: {
            uint8_t memtype = data[0];
            uint16_t addr = data[1] | (data[2] << 8);
            int size = data[3];
            if (size > (RD_BUF_SIZE-2)) {
                printf("# Can't read more than %d bytes at a time\n", RD_BUF_SIZE-2);
                break;
            }
            rd_buf[0] = addr & 0xff;
            rd_buf[1] = addr >> 8;
            read_block(addr, memtype, rd_buf+2, size);
            hexify_sender_start(&henc, MSG_RD, rd_buf, size+2);
            char c;
            while  (hexify_sender_next(&henc, &c)) cdev_put(COM_CDEV, c);
            break;
        }
        case MSG_BUS_REQ:
            printf("# Acquire bus\n");
            set_BUSRQ(true);
            _delay_us(100); // Wait 100us for BUSAK
            if ((PINE & BUSAK) == 0) {
                bus_enable(true);
            }
            break;
        case MSG_BUS_REL:
            printf("# Release bus\n");
            bus_enable(false);
            set_BUSRQ(false);
            break;
        case MSG_RESET:
            printf("# Reset and release\n");
            set_reset(true);
            _delay_us(100);
            bus_enable(false);
            set_BUSRQ(false);
            _delay_ms(50);
            set_reset(false);
            break;
        case MSG_NMI:
            printf("# NMI\n");
            set_NMI(true);
            _delay_us(50);
            set_NMI(false);
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
    hexify_recvr_init(&hdec, msgbuf, MSG_BUF_SIZE);
    // Wait for a message to arrive then process it
    while (1) {
        uint8_t type;
        int len;
        char c = cdev_get(COM_CDEV);
        int ret = hexify_recvr_next(&hdec, c, &type, &len);
        if (ret == 0) {
            led_once(COMS_LED, RATE(0.1));
            do_msg(mon, type, len, msgbuf);
        }
        if (ret < 0) {
            led_once(COMS_LED, RATE(0.02));
            printf("# Hex encoding error %d\n", ret);
        }
    }
}

static mon_t mon;


void set_reset(bool state)
{
    if (state) {
        // Simulate an open-collector output
        CTRL_PORT &= ~RESET;
        CTRL_DDR |= RESET;
    } else {
        CTRL_PORT |= RESET; // Enable pull-up
        CTRL_DDR &= ~RESET;
    }
}

void set_INT(bool state)
{
    if (state) {
        PORTG &= ~INT;
        DDRG |= INT;
    } else {
        PORTG |= INT; // Enable pull-up
        DDRG &= ~INT;
    }
}

void set_NMI(bool state)
{
    if (state) {
        PORTG &= ~NMI;
        DDRG |= NMI;
    } else {
        PORTG |= NMI; // Enable pull-up
        DDRG &= ~NMI;
    }
}

void set_BUSRQ(bool state)
{
    if (state) {
        PORTE &= ~BUSRQ;
    } else {
        PORTE |= BUSRQ;
    }
}

void bus_enable(bool state)
{
    if (state) {
        AL_DDR = 0xff;
        AH_DDR = 0xff;
        CTRL_DDR = IORQ | MREQ | RD | WR | M1;
    } else {
        AL_DDR = 0;
        AH_DDR = 0;
        DA_DDR = 0;
        CTRL_DDR = 0;
        CTRL_PORT = IORQ | MREQ | RD | WR | M1; // Enable pull-ups
    }
}


void init_io(void)
{
    MCUCR |= PUD;
    // Tri-state All the Things
    DDRA = 0;
    DDRB = 1 << COMS_LED_PIN;
    DDRC = 0;
    DDRD = 0;
    PORTE = BUSRQ;  // Ensure /BUSRQ is off 
    DDRE = BUSRQ;
    DDRF = 0;
    PORTG = WAIT;
    DDRG = 0;
    CTRL_PORT = IORQ | MREQ | RD | WR | M1;
}

int main(void)
{
    init_io(); // Get all I/O pins in correct state & direction

    timer_init(TIMER1_RELOAD);

    led_init(leds, LEDS_NUMOF);

    /* turn on global interrupts */
    sei();

    //usart1_init(COM_CDEV, 8); /* 230400 baud - this doesn't receive well enough to cope with adjacent bytes */
    //usart1_init(COM_CDEV, 1); /* 1M baud */
    usart1_init(COM_CDEV, 16); /* 115200 baud */
    stdout = &usart1_fp;

    cdev_put(COM_CDEV, '\n');
    cdev_put(COM_CDEV, '\r');
    PRINT("# MCU Monitor. J.Macfarlane 2020\n\r");
    PRINT(VERSION_MSG);

    main_loop(&mon);

    return 0;
}
