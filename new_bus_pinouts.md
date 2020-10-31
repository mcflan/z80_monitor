# New Z80 Debug and IO Bus Pinouts


## Features

 * Two variants: debug bus and IO bus. The debug bus has all the CPU pins
   broken out,  e.g. for connecting external monitor / programmer / debugger
   hardware to a Z80 board, and the IO bus is designed to provide
   space-efficient connectivity for add-on IO boards.
 * Designed to work with standard 34 and 50 way headers IDC connectors and
   headers.
 * IO bus pinout is the same as the bottom 34 pins of the debug pinout.
 * Multiple ground connections to reduce the ground inductance between boards
   and improve signal integrity.
 * Preserves as closely as possible the top-to-bottom ordering of the pins on a
   40-pin Z80 CPU to help ease PCB routing (especially for the debug bus.)


To make them visually equivalent to what you might find on a board, the pinouts
below are shown top-down, which means the pin numbers are descending. The
two-row headers are numbered in the traditional odd-even pattern to match IDC
connectors. The bus has all the data and address lines on one side and the
control signals, ground and power on the other. When placing a debug connector
on the left hand side of a PCB, the odd numbered pins will be on the right,
making them closest to the CPU. This makes routing easier on prototyping boards
or strip-boards.

## Debug Bus

| Number | Function | Number | Function |
|:------:|:-------- |:------:|:-------- |
| 50 | GND          | 49 | A15          |
| 48 | /RFSH  RSVD2 | 47 | A14          |
| 46 | RSVD1        | 45 | A13          |
| 44 | GND          | 43 | A12          |
| 42 | /BUSRQ       | 41 | A11          |
| 40 | /BUSAK       | 39 | A10          |
| 38 | /HALT        | 37 | A9           |
| 36 | /MREQ        | 35 | A8           |
| 34 | GND          | 33 | A7           |
| 32 | +5V          | 31 | A6           |
| 30 | +5V          | 29 | A5           |
| 28 | RSVD0        | 27 | A4           |
| 26 | /NMI         | 25 | A3           |
| 24 | GND          | 23 | A2           |
| 22 | /INT         | 21 | A1           |
| 20 | /WAIT        | 19 | A0           |
| 18 | GND          | 17 | GND          |
| 16 | /RESET       | 15 | D7           |
| 14 | CLK          | 13 | D6           |
| 12 | GND          | 11 | D5           |
| 10 | /M1          |  9 | D4           |
|  8 | /WR          |  7 | D3           |
|  6 | /RD          |  5 | D2           |
|  4 | /IORQ        |  3 | D1           |
|  2 | GND          |  1 | D0           |


## IO Bus

Note, this is the same as the debug bus as far as pin 34.

| Number | Function | Number | Function |
|:------:|:-------- |:------:|:-------- |
| 34 | GND          | 33 | A7           |
| 32 | +5V          | 31 | A6           |
| 30 | +5V          | 29 | A5           |
| 28 | RSVD0        | 27 | A4           |
| 26 | /NMI         | 25 | A3           |
| 24 | GND          | 23 | A2           |
| 22 | /INT         | 21 | A1           |
| 20 | /WAIT        | 19 | A0           |
| 18 | GND          | 17 | GND          |
| 16 | /RESET       | 15 | D7           |
| 14 | CLK          | 13 | D6           |
| 12 | GND          | 11 | D5           |
| 10 | /M1          |  9 | D4           |
|  8 | /WR          |  7 | D3           |
|  6 | /RD          |  5 | D2           |
|  4 | /IORQ        |  3 | D1           |
|  2 | GND          |  1 | D0           |
