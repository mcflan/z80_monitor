#ifndef POLL_H
#define POLL_H

#include <stdint.h>

/*
 * Go to sleep until data arrives, with a maximum time of
 * <timeout> (in milliseconds). A timeout of less than 0
 * means wait for ever. This is just the sleep/poll bit, the caller
 * needs to actually fetch the data.
 */
uint8_t poll(uint8_t cdev_mask, int timeout, uint8_t timer_mode);

#endif // POLL_H
