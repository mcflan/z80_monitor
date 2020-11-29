
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#include "config.h"
#include "cdev.h"
#include "timer.h"

#include "poll.h"

uint8_t check_cdevs(uint8_t cdev_mask)
{
    uint8_t cdevs_readable = 0;
    int i;
    
    for (i = 0; i < CDEV_NUMOF; i++) {
        if (cdev_mask & (1 << i)) {
            if (cdev_check_read(i)) {
                cdevs_readable |= (1 << i);
            }
        } 
    }
    return cdevs_readable;
}

/*
 * Go to sleep until data arrives, with a maximum time of
 * <timeout> (in milliseconds). A timeout of less than 0
 * means wait for ever. This is just the sleep/poll bit, the caller
 * needs to actually fetch the data. Return value has one bit
 * set for each readable cdev and the MSB indicates a timeout.
 */
uint8_t poll(uint8_t cdev_mask, int timeout, uint8_t timer_mode)
{
    uint32_t count = (uint32_t)timeout*TIMER1_RATE/1000;

    if (timeout < 0)
        return 1;
    if (count >= 65535)
        count = 65535;
    set_sleep_mode(SLEEP_MODE_IDLE);
    timer_start2(ST_UART, timer_mode, (uint16_t)count);

    while (1) {
        cli();
        uint8_t cdevs_readable = check_cdevs(cdev_mask);
        uint8_t got_timeout = (timer_poll2(ST_UART)) ? 0x80 : 0x00;
        uint8_t events = (cdevs_readable & 0x7f) | got_timeout;

        if (events) {
            sei();
            return events;
        }
        sleep_enable();
        sei();
#ifndef NOSLEEP
        sleep_cpu();
#endif
        sleep_disable();
    }
}

