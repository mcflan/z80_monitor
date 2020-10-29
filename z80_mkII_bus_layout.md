# JM Z80 Mk II Bus Layout


Monitor edge connector, from top:

| Number from Bottom | Function |
| ------------------ | -------- |
|   1 | A15 |
|   2 | A14 |
|   3 | A13 |
|   4 | A12 |
|   5 | A11 |
|   6 | A10 |
|   7 | A9 |
|   8 | A8 |
|   9 | /BUSRQ |
|  10 | A7 |
|  11 | A6 |
|  12 | A5 |
|  13 | A4 |
|  14 | A3 |
|  15 | A2 |
|  16 | A1 |
|  17 | A0 |
|  18 | /BUSAK |
|  19 | D7 |
|  20 | D6 |
|  21 | D5 |
|  22 | D4 |
|  23 | D3 |
|  24 | D2 |
|  25 | D1 |
|  26 | D0 |
|  27 | /RD |
|  28 | /MON_WR |
|  29 | /MREQ |
|  30 | /EXT_RESET |
|  31 | NC |
|  32 | GND |
|  33 | NC |
|  34 | NC |
|  35 | NC |
|  36 | NC |
|  37 | NC |
|    | [Index slot] |

Inter-Board connector, from top

| Number from Top | Function | Comment |
| --------------- | -------- | ------- |
|  1 | ?       | Could be a write enable for RAM |
|  2 | /RESET  |
|  3 | /IORQ   |
|  4 | /WR     |
|  5 | /RD     |
|  6 | IO_CLK  |
|  7 | /M1     |
|  8 | A7 |
|  9 | A6  | Possible bad connection in edge connector, CPU side, reads 5 ohms |
| 10 | A5 |
| 11 | A4 |
| 12 | A3 |
| 13 | A2 |
| 14 | A1 |
| 15 | A0 |
| 16 | /INT |
| 17 | D7 |
| 18 | D6 |
| 19 | D5 |
| 20 | D4 |
| 21 | D3 |
| 22 | D2 |
| 23 | D1 |
| 24 | D0 |

