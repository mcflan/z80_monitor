# JM Z80 Mk II Bus Layout


Monitor edge connector, from top:

A15
A14
A13
A12
A11
A10
A9
A8
/BUSRQ
A7
A6
A5
A4
A3
A2
A1
A0
/BUSAK
D7
D6
D5
D4
D3
D2
D1
D0
/RD
???
/MREQ
??? (Goes to PSU card)
NC
GND
NC
NC
NC
NC
NC
[Index slot]

Inter-Board connector, from top

| Number from Top | Function |
| --------------- | -------- |
|  1 | ?                                         |
|  2 |/RESET                                     |
|  3 | /IORQ                                     |
|  4 | /WR                                       |
|  5 | /RD                                       |
|  6 | (Offboard clock, not same as CPU clk??)   |
|  7 | /M1                                       |
|  8 | A7 |
|  9 | A6 (not connected?) |
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

