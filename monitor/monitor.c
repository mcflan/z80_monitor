/*
 * Z80 Monitor board driver
 *
 * (C) Copyright James L Macfarlane, Airborne Engineering Ltd 2020.
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <string.h>
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

void view(uint16_t start)
{

    cdev_put(EXT_CDEV, hexchars[(start >> 12) & 0xf]);
    cdev_put(EXT_CDEV, hexchars[(start >>  8) & 0xf]);
    cdev_put(EXT_CDEV, hexchars[(start >>  4) & 0xf]);
    cdev_put(EXT_CDEV, hexchars[(start >>  0) & 0xf]);
    cdev_put(EXT_CDEV, ' ');
    uint16_t i;
    for (i  = start; i < start+16; i++) {
        write_address(i);
        uint8_t x = read_data();
        cdev_put(EXT_CDEV, hexchars[x >> 4]);
        cdev_put(EXT_CDEV, hexchars[x & 0xf]);
        cdev_put(EXT_CDEV, ' ');
    }
    cdev_put(EXT_CDEV, '\n');
}

void code(void)
{
    uint16_t addr = 0;
    write_address(addr++); write_data(0x00); // NOP
    write_address(addr++); write_data(0x3e); // LD A,0x9B
    write_address(addr++); write_data(0x9B);
    write_address(addr++); write_data(0x32); // LD (0x000f), A
    write_address(addr++); write_data(0x0f);
    write_address(addr++); write_data(0x00);
    write_address(addr++); write_data(0x3C); // INC A
    write_address(addr++); write_data(0x18); // JUMP -6
    write_address(addr++); write_data(0xFA);
    write_address(addr++); write_data(0x00); // NOP
    write_address(addr++); write_data(0x78); // HALT
}

void code2(void)
{
    uint16_t addr = 0;
    write_address(addr++); write_data(0xf3); // 0x00    Disable INT
    write_address(addr++); write_data(0x18); //         JUMP +3
    write_address(addr++); write_data(0x03); //
    write_address(addr++); write_data(0x00); //         NOP                 ; We put counter here
    write_address(addr++); write_data(0x00); //         NOP
    write_address(addr++); write_data(0x00); //         NOP
    write_address(addr++); write_data(0x3e); //         LD A, 0x0f
    write_address(addr++); write_data(0x0f); //
    write_address(addr++); write_data(0xd3); //         OUT (0x01),A        ; Write control to PA 
    write_address(addr++); write_data(0x01); //
    write_address(addr++); write_data(0x21); //         LD HL,0x0000
    write_address(addr++); write_data(0x00); //
    write_address(addr++); write_data(0x00); //
    write_address(addr++); write_data(0x22); //         LD (0x0002), HL
    write_address(addr++); write_data(0x02); //
    write_address(addr++); write_data(0x00); //
    write_address(addr++); write_data(0x23); //         INC HL
    write_address(addr++); write_data(0x7d); //         LD A,L
    write_address(addr++); write_data(0xd3); //         OUT (0x00),A        ; Write data to PA
    write_address(addr++); write_data(0x00); //
    write_address(addr++); write_data(0x18); //         JUMP -9
    write_address(addr++); write_data(-9);   //
    write_address(addr++); write_data(0x00); //         NOP
    write_address(addr++); write_data(0x00); //         NOP
    write_address(addr++); write_data(0x78); //         HALT
}

static void main_loop(void)
{
    uint8_t cdevs = (1 << EXT_CDEV);
    uint8_t cdevs_readable;

    //claim_bus();
    //_delay_us(1);
    //code2();
    while (1) {
        // Sleep for 100ms or until data arrives on UART
        cdevs_readable = poll(cdevs, 1000);
        if (cdevs_readable & (1 << EXT_CDEV)) {
            char c = cdev_get(EXT_CDEV);

            // Echo characters
            cdev_put(EXT_CDEV, c);
            //printf("0x%02X\n\r", c);
        }

        //release_bus();
        //wait(0.01);
        //claim_bus();
        //write_control(0xfb); // Assert /MREQ
        //dump(0x0000);
    }
}

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
    cdev_put(EXT_CDEV, '\n');
    cdev_put(EXT_CDEV, '\r');
    PRINT("MCU Monitor. J.Macfarlane 2020\n\r");
    PRINT(VERSION_MSG);

    //hexify_recvr_init(&decoder, (uint8_t *)&rx_msg, XBEE_MSG_LEN);

    release_bus();

    main_loop();

    return 0;
}
