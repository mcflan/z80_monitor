
#ifndef UART_H
#define UART_H

#include <stdio.h>
#include "cdev.h"

#define UART0_CDEV (0)
#define UART1_CDEV (1)

void uart0_init(int fd, uint16_t rate);
void uart0_on(void);
void uart0_off(void);

void uart1_init(int fd, uint16_t rate);
void uart1_on(void);
void uart1_off(void);

extern FILE uart0_fp;
extern FILE uart1_fp;

#endif /* UART_H */
