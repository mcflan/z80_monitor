
#ifndef TIMER_H
#define TIMER_H

#include <stdint.h>

/* number of software timers */
#define TIMER_ST_NUMOF              (4)

enum {
    TIMER_ST0 = 0,
    TIMER_ST1,
    TIMER_ST2,
    TIMER_ST3,
};

enum {
    TIMER_MODE_OFF = 0,
    TIMER_MODE_ONESHOT,     /* count down, stop at zero */
    TIMER_MODE_CLOCK,       /* count down, reload at zero */
    TIMER_MODE_RESERVED,    /* not implemented */
};


typedef struct led_s {
    volatile uint8_t *port;
    uint8_t pin;
    uint8_t state;
    uint16_t reload;
    uint16_t timer;
} led_t;

typedef void (timer_fn_t)(void *);

extern volatile uint16_t timer_soft0;
extern volatile uint8_t timer1_flag;
extern volatile uint8_t led_flash_rate;

void timer_init(uint16_t reload);

void timer_start(uint8_t st_num, uint8_t mode, uint16_t interval);
void timer_start2(uint8_t st_num, uint8_t mode, uint16_t interval);
void timer_stop(uint8_t st_num);
void timer_assign_fn(uint8_t st_num, timer_fn_t *fn, void *data);
uint8_t timer_poll(uint8_t st_num);
uint8_t timer_poll2(uint8_t st_num);
void timer_sleep(uint8_t st_num);

void led_on(int led);
void led_off(int led);
uint32_t leds_running(void);
void led_once(int led, uint16_t t);
void led_pause(int led, uint16_t t);
void led_blink(int led, uint16_t t);
void led_off_all(void);
void led_init(led_t *leds, int leds_numof);

#endif /* TIMER_H */
