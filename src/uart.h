
#ifndef UART_H
#define UART_H

#include <stdio.h>
#include "cdev.h"

#define UART0_CDEV (0)
#define UART1_CDEV (1)

void usart1_init(int fd, uint16_t rate);
void usart1_on(void);
void usart1_off(void);

extern FILE usart1_fp;

#endif /* UART_H */
