# New Z80 Debug and IO Bus Pinouts

Pinout shown top-down, which means pin numbers are descending


## Debug Bus

| Number | Function | Number | Function |
|:------:|:-------- |:------:|:-------- |
| 49 | A15          | 50 | GND          |
| 47 | A14          | 48 | $\overline{\mathrm{RFSH}}$/RSVD2 |
| 45 | A13          | 46 | RSVD1        |
| 43 | A12          | 44 | GND          |
| 41 | A11          | 42 | $\overline{\mathrm{BUSRQ}}$      |
| 39 | A10          | 40 | $\overline{\mathrm{BUSAK}}$      |
| 37 | A9           | 38 | $\overline{\mathrm{HALT}}$       |
| 35 | A8           | 36 | $\overline{\mathrm{MREQ}}$       |
| 33 | A7           | 34 | GND          |
| 31 | A6           | 32 | +5V          |
| 29 | A5           | 30 | +5V          |
| 27 | A4           | 28 | RSVD0        |
| 25 | A3           | 26 | $\overline{\mathrm{NMI}}$        |
| 23 | A2           | 24 | GND          |
| 21 | A1           | 22 | $\overline{\mathrm{INT}}$        |
| 19 | A0           | 20 | $\overline{\mathrm{WAIT}}$       |
| 17 | GND          | 18 | GND          |
| 15 | D7           | 16 | $\overline{\mathrm{RESET}}$      |
| 13 | D6           | 14 | CLK          |
| 11 | D5           | 12 | GND          |
|  9 | D4           | 10 | $\overline{\mathrm{M1}}$         |
|  7 | D3           |  8 | $\overline{\mathrm{WR}}$         |
|  5 | D2           |  6 | $\overline{\mathrm{RD}}$         |
|  3 | D1           |  4 | $\overline{\mathrm{IORQ}}$       |
|  1 | D0           |  2 | GND          |


