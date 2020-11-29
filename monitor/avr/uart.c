
#include <avr/io.h>
#include <avr/interrupt.h>

#include "uart.h"

static int uart0_fd;
static int uart1_fd;

void uart0_tx_enable(int fd)
{
    UCSR0B |= 1 << UDRIE0;
}

void uart0_init(int fd, uint16_t rate)
{
    /* initialise ring buffer */
    cdev_init(fd, uart0_tx_enable);

    uart0_fd = fd;

    /* Set baud rate */
    UBRR0H = (uint8_t)(rate >> 8);
    UBRR0L = (uint8_t)rate;
    /* double baud clock rate */
    UCSR0A = (1<<U2X0);
    /* async UART mode, no parity, 8 data bits, 1 stop bit */
    UCSR0C = (0<<UMSEL00) | (0<<UPM00) | (0<<USBS0) | (3<<UCSZ00);
    /* enable receiver and transmitter */
    UCSR0B = (1<<RXCIE0) | (1<<RXEN0) | (1<<TXEN0);
}

int uart0_putchar(char c, FILE *stream)
{
    cdev_put(uart0_fd, c);
    return 0;
}


ISR(USART_RX_vect)
{
    cdev_rx(uart0_fd, UDR0);
}

ISR(USART_UDRE_vect)
{
    int16_t ret;

    ret = cdev_tx(uart0_fd);
    if (ret >= 0)
        UDR0 = ret;
    else /* disable TX */
        UCSR0B &= ~(1 << UDRIE0);
}

FILE uart0_fp = FDEV_SETUP_STREAM(uart0_putchar, NULL, _FDEV_SETUP_WRITE);


