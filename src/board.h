#ifndef BOARD_H
#define BOARD_H

/* CPU frequency */
#define F_CPU 16000000UL

#include <avr/io.h>

#define COM_CDEV                   (UART1_CDEV)

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
#define AL_PORT                     (PORTA)
#define AL_DDR                      (DDRA)
#define AH_PORT                     (PORTF)
#define AH_DDR                      (DDRF)

#define DA_PORT                     (PORTC)
#define DA_PIN                      (PINC)
#define DA_DDR                      (DDRC)

#define CTRL_PORT                   (PORTD)
#define CTRL_PIN                    (PIND)
#define CTRL_DDR                    (DDRD)

#define IORQ                        (1 << PD0)
#define MREQ                        (1 << PD1)
#define RXD1                        (1 << PD2)
#define TXD1                        (1 << PD3)
#define RD                          (1 << PD4)
#define WR                          (1 << PD5)
#define M1                          (1 << PD6)
#define RESET                       (1 << PD7)

#define RSVD0                       (1 << PE2)
#define BUSRQ                       (1 << PE3)
#define BUSAK                       (1 << PE4)
#define HALT                        (1 << PE5)
#define RSVD1                       (1 << PE6)
#define RSVD2                       (1 << PE7)

#define WAIT                        (1 << PG0)
#define INT                         (1 << PG1)
#define NMI                         (1 << PG5)

#define LEDS_NUMOF                  (1)
#define LED_PORT                    (PORTB)
#define COMS_LED                    (0)
#define COMS_LED_PIN                (4)


enum {
    MEM_TYPE_MEM = 0,
    MEM_TYPE_IO = 1,
};



/* ADC - Vref is set by an external reference as of PCB Rev.4 */
#define VREF                        (2.500)
#define ADC_BITS                    (10)
/* divide by 64, which gives 125KHz ADC clock for 8MHZ xtal */
#define ADC_CLOCK_DIVIDER (6)

char sleep_read(int fd, int timeout);

#endif /* BOARD_H */
