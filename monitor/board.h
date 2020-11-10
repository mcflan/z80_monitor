#ifndef BOARD_H
#define BOARD_H

/* CPU frequency */
#define F_CPU 16000000UL

#include <avr/io.h>

#define EXT_CDEV                   (UART1_CDEV)

/* timing */

/* Main timer - 100 Hz */
#define TIMER1_PRESCALE             (8)
#define TIMER1_RATE                 (100)
#define TIMER1_RELOAD               (F_CPU/TIMER1_PRESCALE/TIMER1_RATE)

#define RATE(x) (x * TIMER1_RATE)


/* soft timer designations */
#define ST_UART                     (0)
#define ST_WAIT                     (1)
#define ST_LED                      (2)
#define ST_FIX                      (3)


/* I/O pins */

#define NX_BUSRQ                    (1 << PC4)
#define NX_WR                       (1 << PC3)
#define NX_RD                       (1 << PC2)

// Registers
#define REG_DATA                    (0)
#define REG_CONTROL                 (1)
#define REG_ADDR_L                  (2)
#define REG_ADDR_H                  (3)

// Control register bits
#define CTRL_EPROM_EN               (1 << 0)
#define CTRL_PROG_EN                (1 << 1)
#define CTRL_MREQ                   (1 << 2)
#define CTRL_IORQ                   (1 << 3)


/* ADC - Vref is set by an external reference as of PCB Rev.4 */
#define VREF                        (2.500)
#define ADC_BITS                    (10)
/* divide by 64, which gives 125KHz ADC clock for 8MHZ xtal */
#define ADC_CLOCK_DIVIDER (6)

char sleep_read(int fd, int timeout);

#endif /* BOARD_H */
