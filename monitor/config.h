#ifndef CONFIG_H
#define CONFIG_H

// Common (not board-specific) config


/* Main timer - 100 Hz */
#define TIMER1_PRESCALE             (8)
#define TIMER1_RATE                 (100)
#define TIMER1_RELOAD               (F_CPU/TIMER1_PRESCALE/TIMER1_RATE-1)

#define RATE(x) (x * TIMER1_RATE)

#define ST_UART                     (0)


#endif
