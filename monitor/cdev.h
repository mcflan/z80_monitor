#ifndef CDEV_H
#define CDEV_H

/*
 * Character device buffered asynchronous i/o module.
 *
 * James L Macfarlane 2008.
 */

#ifndef CDEV_NUMOF
    #define CDEV_NUMOF (2)
#endif

#ifndef CDEV_BUF_SIZE
    #define CDEV_BUF_SIZE (128)
#endif

void cdev_init(int fd, void (*tx_enable_fn)(int fd));
void cdev_put(int fd, char data);
int cdev_write(int fd, const uint8_t *buf, int size);
int cdev_read(int fd, uint8_t *buf, int size);
char cdev_get(int fd);
char cdev_check_read(int fd);
void cdev_rx(int fd, uint8_t c);
int16_t cdev_tx(int fd);
void cdev_flush_rx(int fd);

#endif /* CDEV_H */
