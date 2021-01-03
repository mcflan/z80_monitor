#ifndef DEBUG_H
#define DEBUG_H

/*
 * Header for debugging and error reporting.
 *
 * J.Macfarlane 2013.
 */

/*
 * PSTR is to indicate storage is in flash memory on AVR
 * architecture.
 */

#include <stdio.h>

#ifdef AVR
    #include <avr/pgmspace.h>
#else
    #include <stdlib.h>
    #define PSTR(x) (x)
    #define printf_P(fmt, ...) printf(__VA_ARGS__)
    #define PROGMEM
#endif

/*
 * Convenience function to print messages over UART.
 * Like printf but stores format string in program memory instead of RAM.
 */
#define PRINT(fmt, ...) \
    do { \
        printf_P(PSTR(fmt), ##__VA_ARGS__); \
    } while (0)\


#ifdef DEBUG

    extern uint8_t debug_lvl;
    #define PRINTD(lvl, fmt, ...) \
        if (lvl >= debug_lvl) { \
            printf("%s: ", __func__); \
            printf_P(PSTR(fmt), ##__VA_ARGS__); \
            putchar('\n'); \
        } \

    #define WARNING(fmt, ...) \
        do { \
            printf_P(PSTR("warning: %s: "), __func__); \
            printf_P(PSTR(fmt), ##__VA_ARGS__); \
            putchar('\n'); \
        } while (0)\

    #define ERROR(fmt, ...) \
        do { \
            printf_P(PSTR("error: %s: "), __func__); \
            printf_P(PSTR(fmt), ##__VA_ARGS__); \
            putchar('\n'); \
        } while (0)\

    #define ERROR_IF(condition, fmt, ...) \
        if (condition) { \
            printf_P(PSTR("error: %s: "), __func__); \
            printf_P(PSTR(fmt), ##__VA_ARGS__); \
            putchar('\n'); \
        } \

#else
    #define PRINTD(lvl, fmt, ...) while(0)
    #define WARNING(fmt, ...) while(0)
    #define ERROR(fmt, ...) while(0)
    #define ERROR_IF(condition, fmt, ...) while(0)
#endif



#endif /* DEBUG_H */
