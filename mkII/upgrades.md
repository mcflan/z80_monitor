# Notes about hardware upgrades & repairs made in autumn 2020

## New mounting feet and other mechanical things

See `mechanical` directory.

# LCD

Old LCD died.

New 20x4 LCD with amber LED back light. Farnell p/n/ 2675669, Mfg: Midas, Mfg
p/n MC42004A6W-FPTLA-V2, controller IC ST7066U.

Problem is that enable pin is active high. Use spare NAND gate IC12a as
inverter.  Convert pin 13 (previously clock) to extra GND line as new module
has internal clock.  We probably only just meet timing with 2MHz Z80. The LCD
might be better off on PIO2 instead of on bus.

## Eliminating PSU/Clock/Reset Board

 * Clock replaced with onboard Epson 2MHz module Q3204DC21033300, RS p/n
   478-5806.
 * Reset circuit replaced with MAX691 which now also controls /CE for main SRAM
   and does battery back-up switching.
 * Add 4-pin molex for batt (also 5v)
 * Add 2-pin molex for 12v in.
 * Remove pull-up from /RESET.
 * Move SRAM /CE pull-up to input side of MAX691.
 * Move 7805 on to board with bigger heatsink.

# Misc

 * Decrease all /CE pull-ups to 2K2.
 * Re-connect broken IEO/IEI line between CTC and 2nd PIO.


## /WE gating circuit bypassed.

## Serial Interface

 * Eliminate 1/8 divider from baud clock cct as I don't think I quite realised
   back in 1991 that the UART has an internal 1/16 divider.
 * Add FTDI std pinout connector for TTL-level serial I/O for debugging.  TXD
   and RXD only.
