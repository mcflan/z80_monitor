
#include <avr/io.h>
#include <avr/interrupt.h>

#include "uart.h"

static int usart1_fd;
static int uart1_fd;

void usart1_tx_enable(int fd)
{
    UCSR1B |= 1 << UDRIE0;
}

void usart1_init(int fd, uint16_t rate)
{
    /* initialise ring buffer */
    cdev_init(fd, usart1_tx_enable);

    usart1_fd = fd;

    /* Set baud rate */
    UBRR1H = (uint8_t)(rate >> 8);
    UBRR1L = (uint8_t)rate;
    /* double baud clock rate */
    UCSR1A = (1<<U2X0);
    /* async UART mode, no parity, 8 data bits, 1 stop bit */
    UCSR1C = (0<<UMSEL00) | (0<<UPM00) | (0<<USBS0) | (3<<UCSZ00);
    /* enable receiver and transmitter */
    UCSR1B = (1<<RXCIE0) | (1<<RXEN0) | (1<<TXEN0);
}

int usart1_putchar(char c, FILE *stream)
{
    cdev_put(usart1_fd, c);
    return 0;
}


ISR(USART1_RX_vect)
{
    cdev_rx(usart1_fd, UDR1);
}

ISR(USART1_UDRE_vect)
{
    int16_t ret;

    ret = cdev_tx(usart1_fd);
    if (ret >= 0)
        UDR1 = ret;
    else /* disable TX */
        UCSR1B &= ~(1 << UDRIE0);
}

FILE usart1_fp = FDEV_SETUP_STREAM(usart1_putchar, NULL, _FDEV_SETUP_WRITE);


