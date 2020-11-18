EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L jm_Z80:6402 U24
U 1 1 6026A36B
P 5500 3800
F 0 "U24" H 5500 3800 50  0000 C CNN
F 1 "D3-6402" H 5500 3700 50  0000 C CNN
F 2 "Housings_DIP:DIP-40_W15.24mm_Socket" H 5500 2400 50  0001 C CNN
F 3 "" H 5450 2200 50  0001 C CNN
	1    5500 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0100
U 1 1 6026BC59
P 5500 2300
F 0 "#PWR0100" H 5500 2150 50  0001 C CNN
F 1 "+5V" H 5515 2473 50  0000 C CNN
F 2 "" H 5500 2300 50  0001 C CNN
F 3 "" H 5500 2300 50  0001 C CNN
	1    5500 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6026C256
P 5500 5100
F 0 "#PWR0101" H 5500 4850 50  0001 C CNN
F 1 "GND" H 5650 5050 50  0000 C CNN
F 2 "" H 5500 5100 50  0001 C CNN
F 3 "" H 5500 5100 50  0001 C CNN
	1    5500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2500 5500 2300
Wire Wire Line
	6150 5000 7200 5000
Text HLabel 7200 5000 2    50   Input ~ 0
RX_CLK
$Comp
L jm_Z80:MAX232 U27
U 1 1 602B7C11
P 9150 2950
F 0 "U27" H 9100 3350 50  0000 C CNN
F 1 "MAX232" H 9100 3250 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 9200 1900 50  0001 L CNN
F 3 "" H 9150 3050 50  0001 C CNN
	1    9150 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U25
U 1 1 602BCD2D
P 5500 5900
F 0 "U25" H 5500 5900 50  0000 C CNN
F 1 "74LS139" H 5450 5800 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 5500 5900 50  0001 C CNN
F 3 "" H 5500 5900 50  0001 C CNN
	1    5500 5900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U25
U 2 1 602BE40F
P 5500 6800
F 0 "U25" H 5500 6800 50  0000 C CNN
F 1 "74LS139" H 5450 6700 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 5500 6800 50  0001 C CNN
F 3 "" H 5500 6800 50  0001 C CNN
	2    5500 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U25
U 3 1 602BF0C7
P 8750 5850
F 0 "U25" H 8980 5896 50  0000 L CNN
F 1 "74LS139" H 8980 5805 50  0000 L CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 8750 5850 50  0001 C CNN
F 3 "" H 8750 5850 50  0001 C CNN
	3    8750 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U23
U 1 1 602C30E6
P 4200 6800
F 0 "U23" H 4200 6800 50  0000 C CNN
F 1 "74LS32" H 4200 7034 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4200 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4200 6800 50  0001 C CNN
	1    4200 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS365 U22
U 1 1 602C5468
P 3150 4400
F 0 "U22" H 3150 4300 50  0000 C CNN
F 1 "74LS365" H 3150 4200 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 3150 4400 50  0001 C CNN
F 3 "" H 3150 4400 50  0001 C CNN
	1    3150 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5000 4000 3650 4000
Wire Wire Line
	5000 4100 3650 4100
Wire Wire Line
	5000 4200 3650 4200
$Comp
L power:GND #PWR099
U 1 1 602C9A97
P 4900 4300
F 0 "#PWR099" H 4900 4050 50  0001 C CNN
F 1 "GND" H 4905 4127 50  0000 C CNN
F 2 "" H 4900 4300 50  0001 C CNN
F 3 "" H 4900 4300 50  0001 C CNN
	1    4900 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 4300 4900 4300
Wire Wire Line
	3650 4400 4100 4400
Wire Wire Line
	4350 4400 4350 3700
Wire Wire Line
	4350 3700 5000 3700
Wire Wire Line
	6000 3800 6650 3800
Wire Wire Line
	6650 3800 6650 5500
Wire Wire Line
	6650 5500 4350 5500
Wire Wire Line
	4350 5500 4350 4500
Wire Wire Line
	4350 4500 3650 4500
Wire Wire Line
	2650 4000 2450 4000
Wire Wire Line
	2650 4100 2450 4100
Wire Wire Line
	2650 4200 2450 4200
Wire Wire Line
	2650 4300 2450 4300
Wire Wire Line
	2650 4400 2450 4400
Wire Wire Line
	2650 4500 2450 4500
Entry Wire Line
	2350 4400 2450 4500
Entry Wire Line
	2350 4300 2450 4400
Entry Wire Line
	2350 4200 2450 4300
Entry Wire Line
	2350 4100 2450 4200
Entry Wire Line
	2350 4000 2450 4100
Entry Wire Line
	2350 3900 2450 4000
Text Label 2500 4000 0    50   ~ 0
D0
Text Label 2500 4100 0    50   ~ 0
D1
Text Label 2500 4200 0    50   ~ 0
D2
Text Label 2500 4300 0    50   ~ 0
D5
Text Label 2500 4500 0    50   ~ 0
D3
Text Label 2500 4400 0    50   ~ 0
D4
Entry Bus Bus
	2250 1900 2350 2000
Text HLabel 2050 1900 0    50   BiDi ~ 0
D[7..0]
Entry Bus Bus
	4500 1900 4600 2000
Wire Wire Line
	5000 3400 4700 3400
Wire Wire Line
	5000 3300 4700 3300
Wire Wire Line
	5000 3200 4700 3200
Wire Wire Line
	5000 3100 4700 3100
Wire Wire Line
	5000 3000 4700 3000
Wire Wire Line
	5000 2900 4700 2900
Wire Wire Line
	5000 2800 4700 2800
Wire Wire Line
	5000 2700 4700 2700
Entry Wire Line
	4600 3300 4700 3400
Entry Wire Line
	4600 3200 4700 3300
Entry Wire Line
	4600 3100 4700 3200
Entry Wire Line
	4600 3000 4700 3100
Entry Wire Line
	4600 2900 4700 3000
Entry Wire Line
	4600 2800 4700 2900
Entry Wire Line
	4600 2700 4700 2800
Entry Wire Line
	4600 2600 4700 2700
Text Label 4750 3400 0    50   ~ 0
D7
Text Label 4750 3300 0    50   ~ 0
D6
Text Label 4750 3200 0    50   ~ 0
D5
Text Label 4750 3100 0    50   ~ 0
D4
Text Label 4750 3000 0    50   ~ 0
D3
Text Label 4750 2900 0    50   ~ 0
D2
Text Label 4750 2800 0    50   ~ 0
D1
Text Label 4750 2700 0    50   ~ 0
D0
Entry Bus Bus
	6400 1900 6500 2000
Entry Bus Bus
	6400 1900 6500 2000
Wire Wire Line
	6000 3400 6400 3400
Wire Wire Line
	6000 3300 6400 3300
Wire Wire Line
	6000 3200 6400 3200
Wire Wire Line
	6000 3100 6400 3100
Wire Wire Line
	6000 3000 6400 3000
Wire Wire Line
	6000 2900 6400 2900
Wire Wire Line
	6000 2800 6400 2800
Wire Wire Line
	6000 2700 6400 2700
Entry Wire Line
	6500 3300 6400 3400
Entry Wire Line
	6400 3300 6500 3200
Entry Wire Line
	6400 3200 6500 3100
Entry Wire Line
	6400 3100 6500 3000
Entry Wire Line
	6400 3000 6500 2900
Entry Wire Line
	6400 2900 6500 2800
Entry Wire Line
	6400 2800 6500 2700
Entry Wire Line
	6400 2700 6500 2600
Text Label 6100 3400 0    50   ~ 0
D7
Text Label 6100 3300 0    50   ~ 0
D6
Text Label 6100 3200 0    50   ~ 0
D5
Text Label 6100 3100 0    50   ~ 0
D4
Text Label 6100 3000 0    50   ~ 0
D3
Text Label 6100 2900 0    50   ~ 0
D2
Text Label 6100 2800 0    50   ~ 0
D1
Text Label 6100 2700 0    50   ~ 0
D0
Wire Wire Line
	6000 4850 7200 4850
Text HLabel 7200 4850 2    50   Input ~ 0
TX_CLK
Wire Wire Line
	6000 4400 6400 4400
Text Label 6100 4400 0    50   ~ 0
D0
Entry Wire Line
	6500 4300 6400 4400
Wire Wire Line
	6000 4300 6400 4300
Wire Wire Line
	6000 4200 6400 4200
Wire Wire Line
	6000 4100 6400 4100
Wire Wire Line
	6000 4000 6400 4000
Text Label 6100 4300 0    50   ~ 0
D1
Text Label 6100 4200 0    50   ~ 0
D2
Text Label 6100 4100 0    50   ~ 0
D3
Text Label 6100 4000 0    50   ~ 0
D4
Entry Wire Line
	6400 4300 6500 4200
Entry Wire Line
	6400 4200 6500 4100
Entry Wire Line
	6400 4100 6500 4000
Entry Wire Line
	6400 4000 6500 3900
$Comp
L Transistor_BJT:BC109 Q4
U 1 1 602F53C5
P 3350 5650
F 0 "Q4" H 3541 5696 50  0000 L CNN
F 1 "BC109" H 3541 5605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-18-3" H 3550 5575 50  0001 L CIN
F 3 "http://www.farnell.com/datasheets/296634.pdf" H 3350 5650 50  0001 L CNN
	1    3350 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R24
U 1 1 602F7932
P 3750 5650
F 0 "R24" V 3554 5650 50  0000 C CNN
F 1 "10K" V 3645 5650 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3750 5650 50  0001 C CNN
F 3 "~" H 3750 5650 50  0001 C CNN
	1    3750 5650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C24
U 1 1 602F89A9
P 3750 5850
F 0 "C24" V 3625 5850 50  0000 C CNN
F 1 "47p" V 3550 5850 50  0000 C CNN
F 2 "" H 3750 5850 50  0001 C CNN
F 3 "~" H 3750 5850 50  0001 C CNN
	1    3750 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 5650 3600 5650
Wire Wire Line
	3600 5650 3600 5850
Wire Wire Line
	3600 5850 3650 5850
Connection ~ 3600 5650
Wire Wire Line
	3600 5650 3550 5650
Wire Wire Line
	3850 5850 3900 5850
Wire Wire Line
	3900 5850 3900 5650
Wire Wire Line
	3900 5650 3850 5650
Wire Wire Line
	3900 5650 4100 5650
Wire Wire Line
	4100 5650 4100 4400
Connection ~ 3900 5650
Connection ~ 4100 4400
Wire Wire Line
	4100 4400 4350 4400
$Comp
L power:GND #PWR097
U 1 1 60303BBA
P 3150 5100
F 0 "#PWR097" H 3150 4850 50  0001 C CNN
F 1 "GND" H 3155 4927 50  0000 C CNN
F 2 "" H 3150 5100 50  0001 C CNN
F 3 "" H 3150 5100 50  0001 C CNN
	1    3150 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR098
U 1 1 60304017
P 3250 5850
F 0 "#PWR098" H 3250 5600 50  0001 C CNN
F 1 "GND" H 3255 5677 50  0000 C CNN
F 2 "" H 3250 5850 50  0001 C CNN
F 3 "" H 3250 5850 50  0001 C CNN
	1    3250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5450 3250 5350
Wire Wire Line
	3250 5350 2050 5350
Text HLabel 2050 5350 0    50   3State ~ 0
~INT~
Wire Wire Line
	5000 4700 4600 4700
Text Label 4600 4700 0    50   ~ 0
RXD_TTL
Text Label 6050 4700 0    50   ~ 0
TXD_TTL
Wire Wire Line
	5000 3600 4500 3600
Wire Wire Line
	4500 3600 4500 3800
Wire Wire Line
	4500 6250 6100 6250
Wire Wire Line
	6100 6250 6100 5800
Wire Wire Line
	6100 5800 6000 5800
Wire Wire Line
	5000 3800 4500 3800
Connection ~ 4500 3800
Wire Wire Line
	4500 3800 4500 6250
Wire Wire Line
	6000 3600 6750 3600
Wire Wire Line
	6750 3600 6750 6700
Wire Wire Line
	6750 6700 6000 6700
Wire Wire Line
	6000 5900 6200 5900
Wire Wire Line
	6200 5900 6200 6350
Wire Wire Line
	6200 6350 4250 6350
Wire Wire Line
	4250 6350 4250 4700
Wire Wire Line
	4250 4700 3750 4700
Wire Wire Line
	3650 4800 3750 4800
Wire Wire Line
	3750 4800 3750 4700
Connection ~ 3750 4700
Wire Wire Line
	3750 4700 3650 4700
Wire Wire Line
	6450 4500 6450 5700
Wire Wire Line
	6000 4500 6450 4500
Wire Wire Line
	6350 6300 6350 6350
Wire Wire Line
	6350 6350 6450 6350
Wire Wire Line
	6550 6350 6550 6300
Wire Wire Line
	6450 6350 6450 6800
Wire Wire Line
	6450 6800 6000 6800
Connection ~ 6450 6350
Wire Wire Line
	6450 6350 6550 6350
Wire Wire Line
	5000 5800 4850 5800
Wire Wire Line
	4850 5800 4850 6700
Wire Wire Line
	4850 6700 5000 6700
Wire Wire Line
	5000 5900 4950 5900
Wire Wire Line
	4950 5900 4950 6800
Wire Wire Line
	4950 6800 5000 6800
Wire Wire Line
	5000 6100 4650 6100
Wire Wire Line
	4650 6100 4650 6800
Wire Wire Line
	4650 6800 4500 6800
$Comp
L 74xx:74LS32 U23
U 4 1 6036320C
P 4200 7350
F 0 "U23" H 4200 7350 50  0000 C CNN
F 1 "74LS32" H 4200 7584 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4200 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4200 7350 50  0001 C CNN
	4    4200 7350
	1    0    0    -1  
$EndComp
Text HLabel 2050 6700 0    50   Input ~ 0
~RD~
Wire Wire Line
	4500 7350 4700 7350
Wire Wire Line
	4700 7350 4700 7000
Wire Wire Line
	4700 7000 5000 7000
Wire Wire Line
	3900 7450 3750 7450
Wire Wire Line
	3750 7450 3750 7000
Wire Wire Line
	3750 6900 3900 6900
Wire Wire Line
	3750 7000 2050 7000
Connection ~ 3750 7000
Wire Wire Line
	3750 7000 3750 6900
Text HLabel 2050 7000 0    50   Input ~ 0
~UART_CE~
Wire Wire Line
	3900 7250 2050 7250
Text HLabel 2050 7250 0    50   Input ~ 0
~WR~
Wire Wire Line
	2050 6700 3900 6700
$Comp
L power:GND #PWR0105
U 1 1 6039BDC5
P 9150 4200
F 0 "#PWR0105" H 9150 3950 50  0001 C CNN
F 1 "GND" H 9155 4027 50  0000 C CNN
F 2 "" H 9150 4200 50  0001 C CNN
F 3 "" H 9150 4200 50  0001 C CNN
	1    9150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4200 9150 4050
$Comp
L power:+5V #PWR0104
U 1 1 603A029B
P 9150 1850
F 0 "#PWR0104" H 9150 1700 50  0001 C CNN
F 1 "+5V" H 9165 2023 50  0000 C CNN
F 2 "" H 9150 1850 50  0001 C CNN
F 3 "" H 9150 1850 50  0001 C CNN
	1    9150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2050 9150 1850
$Comp
L Device:CP_Small C25
U 1 1 603A559C
P 8250 2350
F 0 "C25" H 8338 2396 50  0000 L CNN
F 1 "22u" H 8338 2305 50  0000 L CNN
F 2 "" H 8250 2350 50  0001 C CNN
F 3 "~" H 8250 2350 50  0001 C CNN
	1    8250 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C26
U 1 1 603A615D
P 8250 2750
F 0 "C26" H 8338 2796 50  0000 L CNN
F 1 "22u" H 8338 2705 50  0000 L CNN
F 2 "" H 8250 2750 50  0001 C CNN
F 3 "~" H 8250 2750 50  0001 C CNN
	1    8250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2250 8250 2250
Wire Wire Line
	8550 2450 8250 2450
Wire Wire Line
	8550 2650 8250 2650
Wire Wire Line
	8550 2850 8250 2850
$Comp
L Device:CP_Small C27
U 1 1 603B6EBB
P 9800 2400
F 0 "C27" H 9888 2446 50  0000 L CNN
F 1 "22u" H 9888 2355 50  0000 L CNN
F 2 "" H 9800 2400 50  0001 C CNN
F 3 "~" H 9800 2400 50  0001 C CNN
	1    9800 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C28
U 1 1 603B79B9
P 9800 2700
F 0 "C28" H 9888 2746 50  0000 L CNN
F 1 "22u" H 9888 2655 50  0000 L CNN
F 2 "" H 9800 2700 50  0001 C CNN
F 3 "~" H 9800 2700 50  0001 C CNN
	1    9800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2850 9800 2850
Wire Wire Line
	9800 2850 9800 2800
Wire Wire Line
	9650 2250 9800 2250
Wire Wire Line
	9800 2250 9800 2300
Wire Wire Line
	9800 2500 9800 2550
$Comp
L power:GND #PWR0108
U 1 1 603C5326
P 10050 2550
F 0 "#PWR0108" H 10050 2300 50  0001 C CNN
F 1 "GND" H 10055 2377 50  0000 C CNN
F 2 "" H 10050 2550 50  0001 C CNN
F 3 "" H 10050 2550 50  0001 C CNN
	1    10050 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 2550 10050 2550
Connection ~ 9800 2550
Wire Wire Line
	9800 2550 9800 2600
Wire Wire Line
	8200 4700 8200 3050
Wire Wire Line
	8200 3050 8550 3050
Wire Wire Line
	6000 4700 8200 4700
Wire Wire Line
	4600 4700 4600 5350
Wire Wire Line
	4600 5350 8300 5350
Wire Wire Line
	8300 5350 8300 3450
Wire Wire Line
	8300 3450 8550 3450
Wire Wire Line
	6150 5000 6150 5250
Wire Wire Line
	6150 5250 4800 5250
Wire Wire Line
	4800 5250 4800 4850
Wire Wire Line
	4800 4850 5000 4850
Wire Wire Line
	2050 6150 4000 6150
Wire Wire Line
	4000 6150 4000 5800
Wire Wire Line
	4000 5800 4850 5800
Connection ~ 4850 5800
Wire Wire Line
	2050 6300 4100 6300
Wire Wire Line
	4100 6300 4100 5900
Wire Wire Line
	4100 5900 4950 5900
Connection ~ 4950 5900
Text HLabel 2050 6300 0    50   Input ~ 0
A0
Text HLabel 2050 6150 0    50   Input ~ 0
A1
$Comp
L Connector_Generic:Conn_01x05 J5
U 1 1 6041BA2B
P 10550 3400
F 0 "J5" H 10630 3442 50  0000 L CNN
F 1 "Conn_01x05" H 10630 3351 50  0000 L CNN
F 2 "" H 10550 3400 50  0001 C CNN
F 3 "~" H 10550 3400 50  0001 C CNN
	1    10550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6041CB99
P 10250 3850
F 0 "#PWR0109" H 10250 3600 50  0001 C CNN
F 1 "GND" H 10255 3677 50  0000 C CNN
F 2 "" H 10250 3850 50  0001 C CNN
F 3 "" H 10250 3850 50  0001 C CNN
	1    10250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3600 10250 3600
Wire Wire Line
	10250 3600 10250 3850
Wire Wire Line
	9650 3050 10200 3050
Wire Wire Line
	10200 3050 10200 3200
Wire Wire Line
	10200 3200 10350 3200
Wire Wire Line
	9650 3450 10000 3450
Wire Wire Line
	10000 3450 10000 3300
Wire Wire Line
	10000 3300 10350 3300
Wire Wire Line
	9650 3650 10100 3650
Wire Wire Line
	10100 3650 10100 3400
Wire Wire Line
	10100 3400 10350 3400
Wire Wire Line
	10350 3500 10200 3500
Wire Wire Line
	10200 3500 10200 3250
Wire Wire Line
	10200 3250 9650 3250
Text Notes 8350 3300 0    50   ~ 0
NC!
Text Notes 10450 3050 0    50   ~ 0
RS232\nPort
$Comp
L power:GND #PWR0103
U 1 1 60448107
P 8750 6350
F 0 "#PWR0103" H 8750 6100 50  0001 C CNN
F 1 "GND" H 8755 6177 50  0000 C CNN
F 2 "" H 8750 6350 50  0001 C CNN
F 3 "" H 8750 6350 50  0001 C CNN
	1    8750 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 60448535
P 8750 5350
F 0 "#PWR0102" H 8750 5200 50  0001 C CNN
F 1 "+5V" H 8765 5523 50  0000 C CNN
F 2 "" H 8750 5350 50  0001 C CNN
F 3 "" H 8750 5350 50  0001 C CNN
	1    8750 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U23
U 5 1 60448B10
P 9550 5850
F 0 "U23" H 9780 5896 50  0000 L CNN
F 1 "74LS32" H 9780 5805 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9550 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9550 5850 50  0001 C CNN
	5    9550 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6044C96D
P 9550 6350
F 0 "#PWR0107" H 9550 6100 50  0001 C CNN
F 1 "GND" H 9555 6177 50  0000 C CNN
F 2 "" H 9550 6350 50  0001 C CNN
F 3 "" H 9550 6350 50  0001 C CNN
	1    9550 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 6044CCA8
P 9550 5350
F 0 "#PWR0106" H 9550 5200 50  0001 C CNN
F 1 "+5V" H 9565 5523 50  0000 C CNN
F 2 "" H 9550 5350 50  0001 C CNN
F 3 "" H 9550 5350 50  0001 C CNN
	1    9550 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C29
U 1 1 60452700
P 10350 5850
F 0 "C29" H 10442 5896 50  0000 L CNN
F 1 "0u1" H 10442 5805 50  0000 L CNN
F 2 "" H 10350 5850 50  0001 C CNN
F 3 "~" H 10350 5850 50  0001 C CNN
	1    10350 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C30
U 1 1 604531B8
P 10700 5850
F 0 "C30" H 10792 5896 50  0000 L CNN
F 1 "0u1" H 10792 5805 50  0000 L CNN
F 2 "" H 10700 5850 50  0001 C CNN
F 3 "~" H 10700 5850 50  0001 C CNN
	1    10700 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6045356D
P 10350 5950
F 0 "#PWR0111" H 10350 5700 50  0001 C CNN
F 1 "GND" H 10355 5777 50  0000 C CNN
F 2 "" H 10350 5950 50  0001 C CNN
F 3 "" H 10350 5950 50  0001 C CNN
	1    10350 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60453E91
P 10700 5950
F 0 "#PWR0113" H 10700 5700 50  0001 C CNN
F 1 "GND" H 10705 5777 50  0000 C CNN
F 2 "" H 10700 5950 50  0001 C CNN
F 3 "" H 10700 5950 50  0001 C CNN
	1    10700 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 6045A3CF
P 10350 5750
F 0 "#PWR0110" H 10350 5600 50  0001 C CNN
F 1 "+5V" H 10365 5923 50  0000 C CNN
F 2 "" H 10350 5750 50  0001 C CNN
F 3 "" H 10350 5750 50  0001 C CNN
	1    10350 5750
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 6045A9E0
P 10700 5750
F 0 "#PWR0112" H 10700 5600 50  0001 C CNN
F 1 "+5V" H 10715 5923 50  0000 C CNN
F 2 "" H 10700 5750 50  0001 C CNN
F 3 "" H 10700 5750 50  0001 C CNN
	1    10700 5750
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U26
U 3 1 6045B865
P 6450 6000
F 0 "U26" V 6450 6100 50  0000 R CNN
F 1 "74LS00" H 6550 5750 50  0000 R CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 6450 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6450 6000 50  0001 C CNN
	3    6450 6000
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 U32
U 2 1 5F9F56CD
P 5300 7450
F 0 "U32" H 5300 7450 50  0000 C CNN
F 1 "74LS32" H 5300 7684 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5300 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5300 7450 50  0001 C CNN
	2    5300 7450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U32
U 3 1 5F9F777F
P 6250 7450
F 0 "U32" H 6250 7450 50  0000 C CNN
F 1 "74LS32" H 6250 7684 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 6250 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6250 7450 50  0001 C CNN
	3    6250 7450
	1    0    0    -1  
$EndComp
NoConn ~ 5950 7550
NoConn ~ 5950 7350
NoConn ~ 5000 7550
NoConn ~ 5000 7350
Text Notes 5050 7750 0    40   ~ 0
Unused inputs currently floating.\nShould be connected to 0V or +5V
$Comp
L 74xx:74LS00 U26
U 4 1 5FD3BF49
P 3700 3450
F 0 "U26" V 3700 3550 50  0000 R CNN
F 1 "74LS00" H 3800 3200 50  0000 R CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 3700 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3700 3450 50  0001 C CNN
	4    3700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3350 3350 3350
Wire Wire Line
	3350 3350 3350 3450
Wire Wire Line
	3350 3550 3400 3550
Wire Wire Line
	4650 4500 5000 4500
Wire Wire Line
	4000 3450 4650 3450
Wire Wire Line
	4650 3450 4650 4500
$Comp
L power:+5V #PWR0118
U 1 1 5FD709B6
P 3150 3700
F 0 "#PWR0118" H 3150 3550 50  0001 C CNN
F 1 "+5V" H 3165 3873 50  0000 C CNN
F 2 "" H 3150 3700 50  0001 C CNN
F 3 "" H 3150 3700 50  0001 C CNN
	1    3150 3700
	1    0    0    -1  
$EndComp
Text HLabel 2050 3450 0    50   Input ~ 0
~RESET~
Wire Wire Line
	2050 3450 3350 3450
Connection ~ 3350 3450
Wire Wire Line
	3350 3450 3350 3550
NoConn ~ 3650 4300
Text Notes 3700 4350 0    40   ~ 0
This should not be\nfloating
Wire Bus Line
	2050 1900 6400 1900
Wire Bus Line
	2350 2000 2350 4400
Wire Bus Line
	4600 2000 4600 3300
Wire Bus Line
	6500 2000 6500 4300
$EndSCHEMATC
