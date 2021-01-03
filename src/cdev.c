

#include <avr/io.h>
#include <avr/interrupt.h>

#include "cdev.h"

typedef void (cdev_fn_t)(uint8_t);
/*
 * The code in this module only works if the buf_in / buf_out indices
 * are 8-bit wide. Larger widths will not work because they
 * cannot be read into registers in an atomic manner - an
 * interrupt may occur between reading the high byte and the low
 * byte and ruin our day.
 */
typedef struct cdev_s {
    volatile uint8_t tx_in;
    volatile uint8_t tx_out;
    volatile uint8_t rx_in;
    volatile uint8_t rx_out;
    void (*tx_enable_fn)(int fd);
    uint8_t rxbuf[CDEV_BUF_SIZE];
    uint8_t txbuf[CDEV_BUF_SIZE];
} cdev_t;

static cdev_t cdev[CDEV_NUMOF];
 
void cdev_init(int fd, void (*tx_enable_fn)(int fd))
{
    /* initialise ring buffer */
    cdev[fd].tx_in = 0;
    cdev[fd].tx_out = 0;
    cdev[fd].rx_in = 0;
    cdev[fd].rx_out = 0;
    cdev[fd].tx_enable_fn = tx_enable_fn;
}

void cdev_put(int fd, char c)
{
    uint8_t tmp1, tmp2;

    tmp1 = cdev[fd].tx_in;
    tmp2 = tmp1 + 1;
    tmp2 %= CDEV_BUF_SIZE;
    while (cdev[fd].tx_out == tmp2);
    cdev[fd].txbuf[tmp1] = c;
    cdev[fd].tx_in = tmp2;
    cdev[fd].tx_enable_fn(fd);
}

int cdev_write(int fd, const uint8_t *buf, int size)
{
    int i;

    for (i = 0; i < size; i++) {
        cdev_put(fd, buf[i]);
    }
    return i;
}

int cdev_read(int fd, uint8_t *buf, int size)
{
    int i;

    for (i = 0; i < size; i++) {
        buf[i] = cdev_get(fd);
    }
    return i;
}

/*
 * Checks if data available for reading.
 * Returns non-zero if data available, zero if not.
 */
char cdev_check_read(int fd)
{
    return (cdev[fd].rx_in != cdev[fd].rx_out);
}

char cdev_get(int fd)
{
    char c;
    uint8_t tmp;

    tmp = cdev[fd].rx_out;
    /* wait for data to arrive */
    while (cdev[fd].rx_in == tmp);

    c = cdev[fd].rxbuf[tmp++];

    cdev[fd].rx_out = tmp % CDEV_BUF_SIZE;

    return c;
}

void cdev_rx(int fd, uint8_t c)
{
    uint8_t tmp;

    tmp = cdev[fd].rx_in;
    cdev[fd].rxbuf[tmp++] = c;
    tmp %= CDEV_BUF_SIZE;

    /* if buffer is full, overwrite old data first */
    if (cdev[fd].rx_out == tmp) {
        cdev[fd].rx_out = (tmp + 1) % CDEV_BUF_SIZE;
    }
    cdev[fd].rx_in = tmp;
}

void cdev_flush_rx(int fd)
{
    cli();
    cdev[fd].rx_out = cdev[fd].rx_in;
    sei();
}

int16_t cdev_tx(int fd)
{
    if (cdev[fd].tx_in != cdev[fd].tx_out) {
        uint8_t c = cdev[fd].txbuf[cdev[fd].tx_out++];
        cdev[fd].tx_out %= CDEV_BUF_SIZE;
        return c;
    } else {
        return -1;
    }
}

