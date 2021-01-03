#include <stdlib.h>
#include "timer.h"
#include <avr/interrupt.h>
#include <avr/sleep.h>

typedef struct timer_st_s {
    uint16_t reload;
    timer_fn_t *fn;
    void *data;
} timer_st_t;

void leds_run(led_t *leds, int leds_numof);

static led_t *timer_leds;
static int timer_leds_numof;

/* soft timer data */
static timer_st_t softtimers[TIMER_ST_NUMOF];

/* soft timer registers */
static volatile uint16_t timer_st[TIMER_ST_NUMOF];


static volatile uint8_t timer_status;
static uint8_t timer_ctrl;

ISR(TIMER1_COMPA_vect)
{
    uint8_t i;

    /* run soft timers */
    for (i = 0; i < TIMER_ST_NUMOF; i++) {
        switch ((timer_ctrl >> (i*2)) & 3) {
            case TIMER_MODE_OFF:
                /* do nothing */
                break;
            case TIMER_MODE_ONESHOT:
                /* it's a oneshot, count down, stop at zero */
                if (timer_status & (1 << i))
                    break;
                if (timer_st[i] == 0) {
                    timer_status |= (1 << i);  /* tell user */
                    if (softtimers[i].fn)
                        softtimers[i].fn(softtimers[i].data);  /* run user function if present */
                } else
                    timer_st[i]--;
                break;
            case TIMER_MODE_CLOCK:
                /* it's a clock, count down, reload at zero */
                if (timer_st[i] == 0) {
                    timer_status |= (1 << i);  /* tell user */
                    timer_st[i] = softtimers[i].reload; /* reload */
                    if (softtimers[i].fn)
                        softtimers[i].fn(0);  /* run user function if present */
                } else
                    timer_st[i]--;
                break;
            case TIMER_MODE_RESERVED:
                /* not implemented, do nothing */
                break;
        }
    }
    // Run LEDs
    leds_run(timer_leds, timer_leds_numof);
}

void timer_init(uint16_t reload)
{
    uint8_t i;

    for (i = 0; i < TIMER_ST_NUMOF; i++)
        softtimers[i].fn = NULL;

    /* clear soft timer status and control bits */
    timer_ctrl = 0;
    timer_status = 0xff; 
    /* Set Timer1 up in CTC mode with match on OCR1A, 1/8 prescale */
    TCCR1A = 0x00;
    TCCR1B = 0x0A;
    TCNT1H = 0;
    TCNT1L = 0;
    OCR1AH = reload >> 8;
    OCR1AL = reload & 0xff;
    TIMSK1 |= (1 << OCIE1A);
}

void timer_start(uint8_t st_num, uint8_t mode, uint16_t interval)
{
    cli(); /* turn off ints */
    softtimers[st_num].reload = interval;
    timer_st[st_num] = interval;
    timer_status &= ~(1 << st_num);
    timer_ctrl &= ~(3 << (st_num*2));
    timer_ctrl |= (mode & 3) << (st_num*2);
    sei(); /* turn on ints */
}

// As above, but don't reset timer itself if in CLOCK mode.
// Useful when polling on clock type timers.
void timer_start2(uint8_t st_num, uint8_t mode, uint16_t interval)
{
    cli(); /* turn off ints */
    softtimers[st_num].reload = interval;
    if (mode == TIMER_MODE_ONESHOT) {
        timer_st[st_num] = interval;
    }
    timer_status &= ~(1 << st_num);
    timer_ctrl &= ~(3 << (st_num*2));
    timer_ctrl |= (mode & 3) << (st_num*2);
    sei(); /* turn on ints */
}

void timer_stop(uint8_t st_num)
{
    /* should be atomic, no need to turn off ints */
    timer_ctrl &= 0xff ^ (3 << (st_num*2));
}

void timer_assign_fn(uint8_t st_num, timer_fn_t *fn, void *data)
{
    softtimers[st_num].fn = fn;
    softtimers[st_num].data = data;
}

uint8_t timer_poll(uint8_t st_num)
{
    uint8_t status;

    /* turn off interrupts */
    cli();
    /* get current status */
    status = timer_status & (1 << st_num);
    /* reset status */
    timer_status &= ~(1 << st_num);
    /* turn on interrupts */
    sei();
    return status;
}

/*
 * As above but don't turn ints on/off - assume
 * this is done by caller.
 */
uint8_t timer_poll2(uint8_t st_num)
{
    uint8_t status;

    /* get current status */
    status = timer_status & (1 << st_num);
    /* reset status */
    timer_status &= ~(1 << st_num);
    return status;
}

void timer_sleep(uint8_t st_num)
{
    cli();
    while (!(timer_status & (1 << st_num))) {
        sleep_enable();
        sei();
#ifndef NOSLEEP
        sleep_cpu();
#endif
        sleep_disable();
        cli();
    }
    sei();
}


enum {
    LED_STATE_OFF = 0,
    LED_STATE_ON,
    LED_STATE_ON_ONCE,
    LED_STATE_ON_BLINK,
    LED_STATE_OFF_BLINK,
};

void led_on(int lednum)
{
    if (lednum >= timer_leds_numof) return;
    led_t *led = timer_leds + lednum;
    cli();
    led->state = LED_STATE_ON;
    *(led->port) |= (1 << led->pin);
    sei();
}

void led_off(int lednum)
{
    if (lednum >= timer_leds_numof) return;
    led_t *led = timer_leds + lednum;
    cli();
    led->state = LED_STATE_OFF;
    *(led->port) &= ~(1 << led->pin);
    sei();
}

uint32_t leds_running(void)
{
    uint32_t ret = 0;
    int i;
    cli();
    for (i = 0; i < timer_leds_numof; i++) {
        led_t *led = timer_leds + i;
        if (led->state) {
            ret |= (1 << i);
        }
    }
    sei();
    return ret;
}

// Like led_once() but doesn't actually light LED.
// Useful for running LEDs in FSM in conjunction with
// leds _running()
void led_pause(int lednum, uint16_t t)
{
    if (lednum >= timer_leds_numof) return;
    led_t *led = timer_leds + lednum;
    cli();
    led->state = LED_STATE_ON_ONCE;
    *(led->port) &= ~(1 << led->pin);
    led->reload = t;
    led->timer = led->reload;
    sei();
}

void led_once(int lednum, uint16_t t)
{
    if (lednum >= timer_leds_numof) return;
    led_t *led = timer_leds + lednum;
    cli();
    led->state = LED_STATE_ON_ONCE;
    *(led->port) |= (1 << led->pin);
    led->reload = t;
    led->timer = led->reload;
    sei();
}

void led_blink(int lednum, uint16_t t)
{
    if (lednum >= timer_leds_numof) return;
    led_t *led = timer_leds + lednum;
    cli();
    led->state = LED_STATE_ON_BLINK;
    *(led->port) |= (1 << led->pin);
    led->reload = t;
    led->timer = led->reload;
    sei();
}

void led_off_all(void)
{
    int i;
    for (i = 0; i < timer_leds_numof; i++) {
        led_off(i);
    }
}

void led_init(led_t *l, int numof)
{
    cli();
    timer_leds = l;
    timer_leds_numof = numof;
    sei();
}

void leds_run(led_t *leds, int leds_numof)
{
    int i;
    if (leds == NULL) {
        return;
    }
    for (i = 0; i < leds_numof; i++) {
        led_t *led = leds + i;
        switch (led->state) {
            case LED_STATE_OFF:
                break;
            case LED_STATE_ON:
                break;
            case LED_STATE_ON_ONCE:
                if (led->timer == 0) {
                    *(led->port) &= ~(1 << led->pin);
                    led->state = LED_STATE_OFF;
                } else {
                    led->timer--;
                }
                break;
            case LED_STATE_ON_BLINK:
                if (led->timer == 0) {
                    *(led->port) &= ~(1 << led->pin);
                    led->state = LED_STATE_OFF_BLINK;
                    led->timer = led->reload;
                } else {
                    led->timer--;
                }
                break;
            case LED_STATE_OFF_BLINK:
                if (led->timer == 0) {
                    *(led->port) |= (1 << led->pin);
                    led->state = LED_STATE_ON_BLINK;
                    led->timer = led->reload;
                } else {
                    led->timer--;
                }
                break;
        }
    }
}
