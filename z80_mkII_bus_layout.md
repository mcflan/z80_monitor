# JM Z80 Mk II Bus Layout


Monitor edge connector, from top:

| Number from Bottom | Function |
| ------------------ | -------- |
|  37 | A15 |
|  36 | A14 |
|  35 | A13 |
|  34 | A12 |
|  33 | A11 |
|  32 | A10 |
|  31 | A9 |
|  30 | A8 |
|  29 | /BUSRQ |
|  28 | A7 |
|  27 | A6 |
|  26 | A5 |
|  25 | A4 |
|  24 | A3 |
|  23 | A2 |
|  22 | A1 |
|  21 | A0 |
|  20 | /BUSAK |
|  19 | D7 |
|  18 | D6 |
|  17 | D5 |
|  16 | D4 |
|  15 | D3 |
|  14 | D2 |
|  13 | D1 |
|  12 | D0 |
|  11 | /RD |
|  10 | /MON_WR |
|  9 | /MREQ |
|  8 | /EXT_RESET |
|  7 | NC |
|  6 | GND |
|  5 | NC |
|  4 | NC |
|  3 | NC |
|  2 | NC |
|  1 | NC |
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

