EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L Regulator_Linear:LM7805_TO220 U?
U 1 1 5F9AE24B
P 4050 1750
F 0 "U?" H 4050 1992 50  0000 C CNN
F 1 "74LS04" H 4050 1901 50  0000 C CNN
F 2 "" H 4050 1975 50  0001 C CIN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4050 1700 50  0001 C CNN
	1    4050 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 5F9AEB9E
P 3300 2600
F 0 "C?" H 3388 2646 50  0000 L CNN
F 1 "4700u" H 3388 2555 50  0000 L CNN
F 2 "" H 3300 2600 50  0001 C CNN
F 3 "~" H 3300 2600 50  0001 C CNN
	1    3300 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 5F9AF694
P 4700 2600
F 0 "C?" H 4788 2646 50  0000 L CNN
F 1 "10u" H 4788 2555 50  0000 L CNN
F 2 "" H 4700 2600 50  0001 C CNN
F 3 "~" H 4700 2600 50  0001 C CNN
	1    4700 2600
	1    0    0    -1  
$EndComp
$Comp
L Relay:EC2-3NU K?
U 1 1 5F9B5688
P 1550 2700
F 0 "K?" V 783 2700 50  0000 C CNN
F 1 "EC2-3NU" V 874 2700 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Kemet_EC2" H 1550 2700 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_R7002_EC2_EE2.pdf" H 1550 2700 50  0001 C CNN
	1    1550 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3000 2850 2700
Wire Wire Line
	3300 2500 3300 1750
Wire Wire Line
	3300 1750 2850 1750
Wire Wire Line
	2850 1850 2850 1750
Connection ~ 2850 1750
Wire Wire Line
	2850 1750 2400 1750
Wire Wire Line
	3300 2700 3300 3400
Wire Wire Line
	3300 3400 2850 3400
Wire Wire Line
	2850 3400 2400 3400
Connection ~ 2850 3400
Wire Wire Line
	2400 1750 2400 1850
$Comp
L Device:D_Small D?
U 1 1 5F9B8D39
P 2400 1950
F 0 "D?" V 2354 2020 50  0000 L CNN
F 1 "D_Small" V 2445 2020 50  0000 L CNN
F 2 "" V 2400 1950 50  0001 C CNN
F 3 "~" V 2400 1950 50  0001 C CNN
	1    2400 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D?
U 1 1 5F9BC6AE
P 2850 1950
F 0 "D?" V 2804 2020 50  0000 L CNN
F 1 "D_Small" V 2895 2020 50  0000 L CNN
F 2 "" V 2850 1950 50  0001 C CNN
F 3 "~" V 2850 1950 50  0001 C CNN
	1    2850 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D?
U 1 1 5F9BD15C
P 2850 3100
F 0 "D?" V 2804 3170 50  0000 L CNN
F 1 "D_Small" V 2895 3170 50  0000 L CNN
F 2 "" V 2850 3100 50  0001 C CNN
F 3 "~" V 2850 3100 50  0001 C CNN
	1    2850 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 3200 2850 3400
Wire Wire Line
	2400 3400 2400 3200
Wire Wire Line
	2400 2050 2400 2300
$Comp
L Device:D_Small D?
U 1 1 5F9BCB19
P 2400 3100
F 0 "D?" V 2354 3170 50  0000 L CNN
F 1 "D_Small" V 2445 3170 50  0000 L CNN
F 2 "" V 2400 3100 50  0001 C CNN
F 3 "~" V 2400 3100 50  0001 C CNN
	1    2400 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 1750 3700 1750
Connection ~ 3300 1750
Wire Wire Line
	4050 2050 4050 2300
Wire Wire Line
	4050 3400 3300 3400
Connection ~ 3300 3400
Wire Wire Line
	4700 3400 4700 2700
Wire Wire Line
	4050 3400 4700 3400
Connection ~ 4050 3400
Wire Wire Line
	4350 1750 4400 1750
Wire Wire Line
	4700 1750 4700 2500
$Comp
L Device:C_Small C?
U 1 1 5F9CBB08
P 3700 2100
F 0 "C?" H 3792 2146 50  0000 L CNN
F 1 "0u1" H 3792 2055 50  0000 L CNN
F 2 "" H 3700 2100 50  0001 C CNN
F 3 "~" H 3700 2100 50  0001 C CNN
	1    3700 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F9CC324
P 4400 2100
F 0 "C?" H 4492 2146 50  0000 L CNN
F 1 "0u1" H 4492 2055 50  0000 L CNN
F 2 "" H 4400 2100 50  0001 C CNN
F 3 "~" H 4400 2100 50  0001 C CNN
	1    4400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2000 3700 1750
Connection ~ 3700 1750
Wire Wire Line
	3700 1750 3300 1750
Wire Wire Line
	3700 2200 3700 2300
Wire Wire Line
	3700 2300 4050 2300
Connection ~ 4050 2300
Wire Wire Line
	4050 2300 4050 2350
Wire Wire Line
	4050 2350 4400 2350
Wire Wire Line
	4400 2350 4400 2200
Connection ~ 4050 2350
Wire Wire Line
	4050 2350 4050 3400
Wire Wire Line
	4400 2000 4400 1750
Connection ~ 4400 1750
Wire Wire Line
	4400 1750 4700 1750
Wire Wire Line
	1850 2300 2400 2300
Connection ~ 2400 2300
Wire Wire Line
	2400 2300 2400 3000
Wire Wire Line
	1850 2700 2850 2700
Connection ~ 2850 2700
Wire Wire Line
	2850 2700 2850 2050
Wire Wire Line
	1250 2200 950  2200
Wire Wire Line
	2100 3400 2100 3600
Wire Wire Line
	2100 3600 950  3600
Connection ~ 2400 3400
Wire Wire Line
	2400 3400 2200 3400
$Comp
L power:+5V #PWR?
U 1 1 5F9981EE
P 7500 3200
F 0 "#PWR?" H 7500 3050 50  0001 C CNN
F 1 "+5V" H 7515 3373 50  0000 C CNN
F 2 "" H 7500 3200 50  0001 C CNN
F 3 "" H 7500 3200 50  0001 C CNN
	1    7500 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9994AE
P 4950 1850
F 0 "#PWR?" H 4950 1700 50  0001 C CNN
F 1 "+5V" H 4965 2023 50  0000 C CNN
F 2 "" H 4950 1850 50  0001 C CNN
F 3 "" H 4950 1850 50  0001 C CNN
	1    4950 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 1750 4950 1750
Wire Wire Line
	4950 1750 4950 1850
Connection ~ 4700 1750
$Comp
L power:GND #PWR?
U 1 1 5F99B56A
P 4950 3550
F 0 "#PWR?" H 4950 3300 50  0001 C CNN
F 1 "GND" H 4955 3377 50  0000 C CNN
F 2 "" H 4950 3550 50  0001 C CNN
F 3 "" H 4950 3550 50  0001 C CNN
	1    4950 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3400 4950 3400
Wire Wire Line
	4950 3400 4950 3550
Connection ~ 4700 3400
$Comp
L 74xx:74LS04 U?
U 1 1 5F99E5B2
P 4000 4650
F 0 "U?" H 4000 4967 50  0000 C CNN
F 1 "74LS04" H 4000 4876 50  0000 C CNN
F 2 "" H 4000 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4000 4650 50  0001 C CNN
	1    4000 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 5F99EE63
P 5000 4650
F 0 "U?" H 5000 4967 50  0000 C CNN
F 1 "74LS04" H 5000 4876 50  0000 C CNN
F 2 "" H 5000 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5000 4650 50  0001 C CNN
	2    5000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4650 3700 4650
Wire Wire Line
	5400 4650 5300 4650
$Comp
L Device:C_Small C?
U 1 1 5F9AD0D1
P 4500 4650
F 0 "C?" H 4592 4696 50  0000 L CNN
F 1 "33p?" H 4592 4605 50  0000 L CNN
F 2 "" H 4500 4650 50  0001 C CNN
F 3 "~" H 4500 4650 50  0001 C CNN
	1    4500 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 4650 4350 4650
Wire Wire Line
	4600 4650 4650 4650
$Comp
L Device:R_Small R?
U 1 1 5F9B26F7
P 4000 5050
F 0 "R?" V 3804 5050 50  0000 C CNN
F 1 "1K0" V 3895 5050 50  0000 C CNN
F 2 "" H 4000 5050 50  0001 C CNN
F 3 "~" H 4000 5050 50  0001 C CNN
	1    4000 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4150 3600 4650
Wire Wire Line
	4300 4150 3600 4150
$Comp
L Device:Crystal Y?
U 1 1 5F99A24F
P 4450 4150
F 0 "Y?" H 4450 4418 50  0000 C CNN
F 1 "4.00MHz" H 4450 4327 50  0000 C CNN
F 2 "" H 4450 4150 50  0001 C CNN
F 3 "~" H 4450 4150 50  0001 C CNN
	1    4450 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5050 3600 5050
Wire Wire Line
	3600 5050 3600 4650
Connection ~ 3600 4650
Wire Wire Line
	4350 4650 4350 5050
Wire Wire Line
	4350 5050 4100 5050
Connection ~ 4350 4650
Wire Wire Line
	4350 4650 4400 4650
$Comp
L Device:R_Small R?
U 1 1 5F9C25F9
P 5000 5050
F 0 "R?" V 4804 5050 50  0000 C CNN
F 1 "1K0" V 4895 5050 50  0000 C CNN
F 2 "" H 5000 5050 50  0001 C CNN
F 3 "~" H 5000 5050 50  0001 C CNN
	1    5000 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 5050 4650 5050
Wire Wire Line
	4650 5050 4650 4650
Connection ~ 4650 4650
Wire Wire Line
	4650 4650 4700 4650
Wire Wire Line
	5100 5050 5400 5050
Wire Wire Line
	5400 5050 5400 4650
Wire Wire Line
	5400 4650 5500 4650
Connection ~ 5400 4650
Wire Wire Line
	5500 4150 5500 4650
Wire Wire Line
	4600 4150 5500 4150
Connection ~ 5500 4650
Wire Wire Line
	5500 4650 5700 4650
$Comp
L Device:C_Small C?
U 1 1 5F9C927D
P 5700 4900
F 0 "C?" H 5792 4946 50  0000 L CNN
F 1 "33p" H 5792 4855 50  0000 L CNN
F 2 "" H 5700 4900 50  0001 C CNN
F 3 "~" H 5700 4900 50  0001 C CNN
	1    5700 4900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9CA46C
P 5700 5100
F 0 "#PWR?" H 5700 4850 50  0001 C CNN
F 1 "GND" H 5705 4927 50  0000 C CNN
F 2 "" H 5700 5100 50  0001 C CNN
F 3 "" H 5700 5100 50  0001 C CNN
	1    5700 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5100 5700 5000
Wire Wire Line
	5700 4800 5700 4650
Connection ~ 5700 4650
Wire Wire Line
	5700 4650 5950 4650
$Comp
L 74xx:74LS04 U?
U 3 1 5F99881C
P 6250 4650
F 0 "U?" H 6250 4967 50  0000 C CNN
F 1 "74LS04" H 6250 4876 50  0000 C CNN
F 2 "" H 6250 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 4650 50  0001 C CNN
	3    6250 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS197 U?
U 1 1 5F9996BA
P 7500 4350
F 0 "U?" H 7500 5331 50  0000 C CNN
F 1 "74LS04" H 7500 5240 50  0000 C CNN
F 2 "" H 7500 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7500 4350 50  0001 C CNN
	1    7500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4650 6750 4650
Wire Wire Line
	7500 3200 7500 3250
Wire Wire Line
	7000 4850 6900 4850
Wire Wire Line
	6900 4850 6900 4350
$Comp
L power:+5V #PWR?
U 1 1 5F9B2557
P 6900 3500
F 0 "#PWR?" H 6900 3350 50  0001 C CNN
F 1 "+5V" H 6915 3673 50  0000 C CNN
F 2 "" H 6900 3500 50  0001 C CNN
F 3 "" H 6900 3500 50  0001 C CNN
	1    6900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4350 6900 4350
Connection ~ 6900 4350
Wire Wire Line
	6900 4350 6900 3500
Wire Wire Line
	7000 4550 6750 4550
Wire Wire Line
	6750 4550 6750 4650
Connection ~ 6750 4650
Wire Wire Line
	6750 4650 7000 4650
$Comp
L power:GND #PWR?
U 1 1 5F9B853C
P 7500 5250
F 0 "#PWR?" H 7500 5000 50  0001 C CNN
F 1 "GND" H 7505 5077 50  0000 C CNN
F 2 "" H 7500 5250 50  0001 C CNN
F 3 "" H 7500 5250 50  0001 C CNN
	1    7500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5250 7500 5150
$Comp
L Device:C_Small C?
U 1 1 5F9BD23D
P 7700 3400
F 0 "C?" H 7792 3446 50  0000 L CNN
F 1 "47p" H 7792 3355 50  0000 L CNN
F 2 "" H 7700 3400 50  0001 C CNN
F 3 "~" H 7700 3400 50  0001 C CNN
	1    7700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3250 7700 3250
Wire Wire Line
	7700 3250 7700 3300
Connection ~ 7500 3250
Wire Wire Line
	7500 3250 7500 3550
$Comp
L power:GND #PWR?
U 1 1 5F9BF6D1
P 7700 3500
F 0 "#PWR?" H 7700 3250 50  0001 C CNN
F 1 "GND" H 7705 3327 50  0000 C CNN
F 2 "" H 7700 3500 50  0001 C CNN
F 3 "" H 7700 3500 50  0001 C CNN
	1    7700 3500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 3 1 5F9C4A15
P 8850 3950
F 0 "U?" H 8850 4275 50  0000 C CNN
F 1 "74LS04" H 8850 4184 50  0000 C CNN
F 2 "" H 8850 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8850 3950 50  0001 C CNN
	3    8850 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 4 1 5F9C8475
P 8850 4650
F 0 "U?" H 8850 4975 50  0000 C CNN
F 1 "74LS04" H 8850 4884 50  0000 C CNN
F 2 "" H 8850 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8850 4650 50  0001 C CNN
	4    8850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3850 8450 3850
Wire Wire Line
	8450 3850 8450 3950
Wire Wire Line
	8450 4050 8550 4050
Wire Wire Line
	8000 3950 8300 3950
Connection ~ 8450 3950
Wire Wire Line
	8450 3950 8450 4050
Wire Wire Line
	8300 3950 8300 4650
Wire Wire Line
	8300 4650 8450 4650
Wire Wire Line
	8450 4650 8450 4550
Wire Wire Line
	8450 4550 8550 4550
Connection ~ 8300 3950
Wire Wire Line
	8300 3950 8450 3950
Wire Wire Line
	8550 4750 8450 4750
Wire Wire Line
	8450 4750 8450 4650
Connection ~ 8450 4650
Wire Wire Line
	9150 3950 9500 3950
Wire Wire Line
	9150 4650 9500 4650
Text GLabel 9500 3950 2    50   Output ~ 0
IO_CLK
Text GLabel 9500 4650 2    50   Output ~ 0
CPU_CLK
$Comp
L 74xx:74LS00 U?
U 1 1 5F9DD5D0
P 6500 1750
F 0 "U?" H 6500 2075 50  0000 C CNN
F 1 "74LS04" H 6500 1984 50  0000 C CNN
F 2 "" H 6500 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6500 1750 50  0001 C CNN
	1    6500 1750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 5 1 5F9E1199
P 4650 6400
F 0 "U?" H 4880 6446 50  0000 L CNN
F 1 "74LS04" H 4880 6355 50  0000 L CNN
F 2 "" H 4650 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4650 6400 50  0001 C CNN
	5    4650 6400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 4 1 5F9E456B
P 10000 1650
F 0 "U?" H 10000 1967 50  0000 C CNN
F 1 "74LS04" H 10000 1876 50  0000 C CNN
F 2 "" H 10000 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10000 1650 50  0001 C CNN
	4    10000 1650
	1    0    0    -1  
$EndComp
$Comp
L Timer:NE555P U?
U 1 1 5F99BB6F
P 8950 1850
F 0 "U?" H 8950 2431 50  0000 C CNN
F 1 "74LS04" H 8950 2340 50  0000 C CNN
F 2 "" H 9600 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9800 1450 50  0001 C CNN
	1    8950 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 5 1 5F9A3D13
P 7150 1250
F 0 "U?" H 7150 1567 50  0000 C CNN
F 1 "74LS04" H 7150 1476 50  0000 C CNN
F 2 "" H 7150 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7150 1250 50  0001 C CNN
	5    7150 1250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 6 1 5F9A4BF4
P 6400 1250
F 0 "U?" H 6400 1567 50  0000 C CNN
F 1 "74LS04" H 6400 1476 50  0000 C CNN
F 2 "" H 6400 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6400 1250 50  0001 C CNN
	6    6400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1650 9700 1650
Wire Wire Line
	6700 1250 6850 1250
$Comp
L power:+5V #PWR?
U 1 1 5FA00DEB
P 5400 750
F 0 "#PWR?" H 5400 600 50  0001 C CNN
F 1 "+5V" H 5415 923 50  0000 C CNN
F 2 "" H 5400 750 50  0001 C CNN
F 3 "" H 5400 750 50  0001 C CNN
	1    5400 750 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D?
U 1 1 5FA17126
P 7850 1250
F 0 "D?" H 7850 1467 50  0000 C CNN
F 1 "1N4148" H 7850 1376 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7850 1075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7850 1250 50  0001 C CNN
	1    7850 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1250 7450 1250
Wire Wire Line
	8000 1250 8050 1250
Wire Wire Line
	8050 1250 8050 1650
$Comp
L Device:R_Small R?
U 1 1 5FA444C7
P 8050 900
F 0 "R?" V 7854 900 50  0000 C CNN
F 1 "10K" V 7945 900 50  0000 C CNN
F 2 "" H 8050 900 50  0001 C CNN
F 3 "~" H 8050 900 50  0001 C CNN
	1    8050 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 1000 8050 1250
Connection ~ 8050 1250
Wire Wire Line
	8050 800  8050 700 
$Comp
L power:+5V #PWR?
U 1 1 5FA4ECF5
P 8050 700
F 0 "#PWR?" H 8050 550 50  0001 C CNN
F 1 "+5V" H 8065 873 50  0000 C CNN
F 2 "" H 8050 700 50  0001 C CNN
F 3 "" H 8050 700 50  0001 C CNN
	1    8050 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FA5107E
P 5400 950
F 0 "R?" V 5204 950 50  0000 C CNN
F 1 "100K" V 5295 950 50  0000 C CNN
F 2 "" H 5400 950 50  0001 C CNN
F 3 "~" H 5400 950 50  0001 C CNN
	1    5400 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5400 750  5400 850 
Wire Wire Line
	8450 1650 8050 1650
Connection ~ 8050 1650
Wire Wire Line
	8050 1650 8050 1850
Wire Wire Line
	6100 1250 5400 1250
Wire Wire Line
	5400 1250 5400 1050
$Comp
L Device:CP_Small C?
U 1 1 5FA8CE51
P 5400 1450
F 0 "C?" H 5488 1496 50  0000 L CNN
F 1 "4u7" H 5488 1405 50  0000 L CNN
F 2 "" H 5400 1450 50  0001 C CNN
F 3 "~" H 5400 1450 50  0001 C CNN
	1    5400 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1350 5400 1250
Connection ~ 5400 1250
$Comp
L power:GND #PWR?
U 1 1 5FA91B64
P 5400 1550
F 0 "#PWR?" H 5400 1300 50  0001 C CNN
F 1 "GND" H 5405 1377 50  0000 C CNN
F 2 "" H 5400 1550 50  0001 C CNN
F 3 "" H 5400 1550 50  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 5FA95716
P 9600 2300
F 0 "C?" H 9688 2346 50  0000 L CNN
F 1 "4u7" H 9688 2255 50  0000 L CNN
F 2 "" H 9600 2300 50  0001 C CNN
F 3 "~" H 9600 2300 50  0001 C CNN
	1    9600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FA96122
P 9600 1000
F 0 "R?" V 9404 1000 50  0000 C CNN
F 1 "100K" V 9495 1000 50  0000 C CNN
F 2 "" H 9600 1000 50  0001 C CNN
F 3 "~" H 9600 1000 50  0001 C CNN
	1    9600 1000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA96ABD
P 9600 700
F 0 "#PWR?" H 9600 550 50  0001 C CNN
F 1 "+5V" H 9615 873 50  0000 C CNN
F 2 "" H 9600 700 50  0001 C CNN
F 3 "" H 9600 700 50  0001 C CNN
	1    9600 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 700  9600 900 
Wire Wire Line
	9600 1100 9600 1850
Wire Wire Line
	9450 2050 9600 2050
Connection ~ 9600 2050
Wire Wire Line
	9600 2050 9600 2200
Wire Wire Line
	9450 1850 9600 1850
Connection ~ 9600 1850
Wire Wire Line
	9600 1850 9600 2050
$Comp
L power:+5V #PWR?
U 1 1 5FAA5238
P 8950 1050
F 0 "#PWR?" H 8950 900 50  0001 C CNN
F 1 "+5V" H 8965 1223 50  0000 C CNN
F 2 "" H 8950 1050 50  0001 C CNN
F 3 "" H 8950 1050 50  0001 C CNN
	1    8950 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1450 8950 1150
Wire Wire Line
	8950 1150 8300 1150
Wire Wire Line
	8300 1150 8300 2050
Wire Wire Line
	8300 2050 8450 2050
Connection ~ 8950 1150
Wire Wire Line
	8950 1150 8950 1050
$Comp
L power:GND #PWR?
U 1 1 5FAAD8CE
P 8950 2300
F 0 "#PWR?" H 8950 2050 50  0001 C CNN
F 1 "GND" H 8955 2127 50  0000 C CNN
F 2 "" H 8950 2300 50  0001 C CNN
F 3 "" H 8950 2300 50  0001 C CNN
	1    8950 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FAAE21B
P 9600 2450
F 0 "#PWR?" H 9600 2200 50  0001 C CNN
F 1 "GND" H 9605 2277 50  0000 C CNN
F 2 "" H 9600 2450 50  0001 C CNN
F 3 "" H 9600 2450 50  0001 C CNN
	1    9600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 2450 9600 2400
Wire Wire Line
	8950 2300 8950 2250
$Comp
L Switch:SW_Push SW?
U 1 1 5FAB7607
P 5750 2100
F 0 "SW?" H 5750 2385 50  0000 C CNN
F 1 "SW_Push" H 5750 2294 50  0000 C CNN
F 2 "" H 5750 2300 50  0001 C CNN
F 3 "~" H 5750 2300 50  0001 C CNN
	1    5750 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 1850 7950 1850
$Comp
L Device:C_Small C?
U 1 1 5FA3C39E
P 7850 1850
F 0 "C?" H 7942 1896 50  0000 L CNN
F 1 "0u1" H 7942 1805 50  0000 L CNN
F 2 "" H 7850 1850 50  0001 C CNN
F 3 "~" H 7850 1850 50  0001 C CNN
	1    7850 1850
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS00 U?
U 2 1 5F9DEA88
P 7250 1850
F 0 "U?" H 7250 2175 50  0000 C CNN
F 1 "74LS04" H 7250 2084 50  0000 C CNN
F 2 "" H 7250 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7250 1850 50  0001 C CNN
	2    7250 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FB29482
P 5750 950
F 0 "R?" V 5554 950 50  0000 C CNN
F 1 "10K" V 5645 950 50  0000 C CNN
F 2 "" H 5750 950 50  0001 C CNN
F 3 "~" H 5750 950 50  0001 C CNN
	1    5750 950 
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FB29BA1
P 5750 750
F 0 "#PWR?" H 5750 600 50  0001 C CNN
F 1 "+5V" H 5765 923 50  0000 C CNN
F 2 "" H 5750 750 50  0001 C CNN
F 3 "" H 5750 750 50  0001 C CNN
	1    5750 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 750  5750 850 
Wire Wire Line
	5750 1050 5750 1750
$Comp
L power:GND #PWR?
U 1 1 5FB47CB4
P 5750 2350
F 0 "#PWR?" H 5750 2100 50  0001 C CNN
F 1 "GND" H 5755 2177 50  0000 C CNN
F 2 "" H 5750 2350 50  0001 C CNN
F 3 "" H 5750 2350 50  0001 C CNN
	1    5750 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2350 5750 2300
Wire Wire Line
	6200 1650 6100 1650
Wire Wire Line
	6100 1650 6100 1750
Wire Wire Line
	6100 1850 6200 1850
Wire Wire Line
	6100 1750 6000 1750
Connection ~ 6100 1750
Wire Wire Line
	6100 1750 6100 1850
Connection ~ 5750 1750
Wire Wire Line
	5750 1750 5750 1900
Wire Wire Line
	7750 1850 7550 1850
Wire Wire Line
	6950 1750 6800 1750
$Comp
L Device:R_Small R?
U 1 1 5FB9B001
P 6700 2200
F 0 "R?" V 6504 2200 50  0000 C CNN
F 1 "10K" V 6595 2200 50  0000 C CNN
F 2 "" H 6700 2200 50  0001 C CNN
F 3 "~" H 6700 2200 50  0001 C CNN
	1    6700 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 1950 6900 1950
Wire Wire Line
	6900 1950 6900 2200
Wire Wire Line
	6900 2200 6800 2200
Wire Wire Line
	6600 2200 6400 2200
Text GLabel 6400 2200 0    50   Input ~ 0
NC
Connection ~ 6000 1750
Wire Wire Line
	6000 1750 5750 1750
Wire Wire Line
	10300 1650 10450 1650
Text GLabel 10450 1650 2    50   Output ~ 0
~RESET
Text GLabel 10450 2800 2    50   Input ~ 0
~EXT_RESET
$Comp
L Device:Battery BT?
U 1 1 5FBE2A2C
P 2100 5550
F 0 "BT?" H 2208 5596 50  0000 L CNN
F 1 "3.6V NiCad" H 2208 5505 50  0000 L CNN
F 2 "" V 2100 5610 50  0001 C CNN
F 3 "~" V 2100 5610 50  0001 C CNN
	1    2100 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBE52EB
P 2100 5800
F 0 "#PWR?" H 2100 5550 50  0001 C CNN
F 1 "GND" H 2105 5627 50  0000 C CNN
F 2 "" H 2100 5800 50  0001 C CNN
F 3 "" H 2100 5800 50  0001 C CNN
	1    2100 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5800 2100 5750
$Comp
L Device:R_Small R?
U 1 1 5FBEB06D
P 2500 5200
F 0 "R?" V 2304 5200 50  0000 C CNN
F 1 "47R" V 2395 5200 50  0000 C CNN
F 2 "" H 2500 5200 50  0001 C CNN
F 3 "~" H 2500 5200 50  0001 C CNN
	1    2500 5200
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 5FBEF928
P 3050 5650
F 0 "C?" H 3138 5696 50  0000 L CNN
F 1 "470u" H 3138 5605 50  0000 L CNN
F 2 "" H 3050 5650 50  0001 C CNN
F 3 "~" H 3050 5650 50  0001 C CNN
	1    3050 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D?
U 1 1 5FBF1E70
P 2900 4900
F 0 "D?" V 2854 4970 50  0000 L CNN
F 1 "1N4001" V 2945 4970 50  0000 L CNN
F 2 "" V 2900 4900 50  0001 C CNN
F 3 "~" V 2900 4900 50  0001 C CNN
	1    2900 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC1464B
P 3050 5800
F 0 "#PWR?" H 3050 5550 50  0001 C CNN
F 1 "GND" H 3055 5627 50  0000 C CNN
F 2 "" H 3050 5800 50  0001 C CNN
F 3 "" H 3050 5800 50  0001 C CNN
	1    3050 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5800 3050 5750
Wire Wire Line
	2100 5350 2100 5200
Wire Wire Line
	2100 5200 2400 5200
Wire Wire Line
	2600 5200 2900 5200
Wire Wire Line
	3050 5200 3050 5550
Wire Wire Line
	2900 5000 2900 5200
Connection ~ 2900 5200
Wire Wire Line
	2900 5200 3050 5200
$Comp
L power:+5V #PWR?
U 1 1 5FC29E18
P 2900 4700
F 0 "#PWR?" H 2900 4550 50  0001 C CNN
F 1 "+5V" H 2915 4873 50  0000 C CNN
F 2 "" H 2900 4700 50  0001 C CNN
F 3 "" H 2900 4700 50  0001 C CNN
	1    2900 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4700 2900 4800
Wire Wire Line
	3050 5200 3400 5200
Connection ~ 3050 5200
Text GLabel 3400 5200 2    50   Output ~ 0
VBAT
$Comp
L Switch:SW_SPDT_MSM SW?
U 1 1 5FC3BD85
P 1300 4450
F 0 "SW?" V 1254 4598 50  0000 L CNN
F 1 "SW_SPDT_MSM" V 1345 4598 50  0000 L CNN
F 2 "" H 1300 4450 50  0001 C CNN
F 3 "~" H 1300 4450 50  0001 C CNN
	1    1300 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 3100 2200 3100
Wire Wire Line
	2200 3100 2200 3400
Connection ~ 2200 3400
Wire Wire Line
	2200 3400 2100 3400
Wire Wire Line
	1250 3100 1200 3100
Wire Wire Line
	1200 3100 1200 4100
Wire Wire Line
	1200 4100 1300 4100
$Comp
L Device:D_Small D?
U 1 1 5FC4C8F8
P 2250 4100
F 0 "D?" V 2204 4170 50  0000 L CNN
F 1 "1N4001" V 2295 4170 50  0000 L CNN
F 2 "" V 2250 4100 50  0001 C CNN
F 3 "~" V 2250 4100 50  0001 C CNN
	1    2250 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FC4DF55
P 1900 4100
F 0 "R?" V 1704 4100 50  0000 C CNN
F 1 "47R" V 1795 4100 50  0000 C CNN
F 2 "" H 1900 4100 50  0001 C CNN
F 3 "~" H 1900 4100 50  0001 C CNN
	1    1900 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 4100 2000 4100
Wire Wire Line
	2350 4100 2700 4100
Wire Wire Line
	2700 4100 2700 3950
$Comp
L power:+5V #PWR?
U 1 1 5FC5B37C
P 2700 3950
F 0 "#PWR?" H 2700 3800 50  0001 C CNN
F 1 "+5V" H 2715 4123 50  0000 C CNN
F 2 "" H 2700 3950 50  0001 C CNN
F 3 "" H 2700 3950 50  0001 C CNN
	1    2700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4250 1300 4100
Connection ~ 1300 4100
Wire Wire Line
	1300 4100 1800 4100
Wire Wire Line
	1400 4650 1400 5200
Wire Wire Line
	1400 5200 2100 5200
Connection ~ 2100 5200
$Comp
L power:GND #PWR?
U 1 1 5FC6AC4E
P 1200 4800
F 0 "#PWR?" H 1200 4550 50  0001 C CNN
F 1 "GND" H 1205 4627 50  0000 C CNN
F 2 "" H 1200 4800 50  0001 C CNN
F 3 "" H 1200 4800 50  0001 C CNN
	1    1200 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4800 1200 4650
$Comp
L 74xx:74LS00 U?
U 5 1 5FC902D7
P 5500 6400
F 0 "U?" H 5500 6725 50  0000 C CNN
F 1 "74LS04" H 5500 6634 50  0000 C CNN
F 2 "" H 5500 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5500 6400 50  0001 C CNN
	5    5500 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC9B2D7
P 4650 6900
F 0 "#PWR?" H 4650 6650 50  0001 C CNN
F 1 "GND" H 4655 6727 50  0000 C CNN
F 2 "" H 4650 6900 50  0001 C CNN
F 3 "" H 4650 6900 50  0001 C CNN
	1    4650 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC9C319
P 5500 6900
F 0 "#PWR?" H 5500 6650 50  0001 C CNN
F 1 "GND" H 5505 6727 50  0000 C CNN
F 2 "" H 5500 6900 50  0001 C CNN
F 3 "" H 5500 6900 50  0001 C CNN
	1    5500 6900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC9D984
P 4650 5650
F 0 "#PWR?" H 4650 5500 50  0001 C CNN
F 1 "+5V" H 4665 5823 50  0000 C CNN
F 2 "" H 4650 5650 50  0001 C CNN
F 3 "" H 4650 5650 50  0001 C CNN
	1    4650 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC9E661
P 5500 5650
F 0 "#PWR?" H 5500 5500 50  0001 C CNN
F 1 "+5V" H 5515 5823 50  0000 C CNN
F 2 "" H 5500 5650 50  0001 C CNN
F 3 "" H 5500 5650 50  0001 C CNN
	1    5500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5650 4650 5700
Wire Wire Line
	5500 5650 5500 5700
$Comp
L Device:C_Small C?
U 1 1 5FCB0E29
P 5000 5900
F 0 "C?" H 5092 5946 50  0000 L CNN
F 1 "47p" H 5092 5855 50  0000 L CNN
F 2 "" H 5000 5900 50  0001 C CNN
F 3 "~" H 5000 5900 50  0001 C CNN
	1    5000 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FCB20B3
P 5900 5900
F 0 "C?" H 5992 5946 50  0000 L CNN
F 1 "47p" H 5992 5855 50  0000 L CNN
F 2 "" H 5900 5900 50  0001 C CNN
F 3 "~" H 5900 5900 50  0001 C CNN
	1    5900 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5700 5000 5700
Wire Wire Line
	5000 5700 5000 5800
Connection ~ 4650 5700
Wire Wire Line
	4650 5700 4650 5900
Wire Wire Line
	5500 5700 5900 5700
Wire Wire Line
	5900 5700 5900 5800
Connection ~ 5500 5700
Wire Wire Line
	5500 5700 5500 5900
$Comp
L power:GND #PWR?
U 1 1 5FCD30AD
P 5000 6000
F 0 "#PWR?" H 5000 5750 50  0001 C CNN
F 1 "GND" H 5005 5827 50  0000 C CNN
F 2 "" H 5000 6000 50  0001 C CNN
F 3 "" H 5000 6000 50  0001 C CNN
	1    5000 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FCD359C
P 5900 6000
F 0 "#PWR?" H 5900 5750 50  0001 C CNN
F 1 "GND" H 5905 5827 50  0000 C CNN
F 2 "" H 5900 6000 50  0001 C CNN
F 3 "" H 5900 6000 50  0001 C CNN
	1    5900 6000
	1    0    0    -1  
$EndComp
Text GLabel 950  3600 0    50   Input ~ 0
0V
Text GLabel 950  2200 0    50   Input ~ 0
+12V_IN
Wire Wire Line
	6000 2800 10450 2800
Wire Wire Line
	6000 1750 6000 2800
$Comp
L power:+5V #PWR?
U 1 1 5FD8636B
P 9550 5300
F 0 "#PWR?" H 9550 5150 50  0001 C CNN
F 1 "+5V" H 9565 5473 50  0000 C CNN
F 2 "" H 9550 5300 50  0001 C CNN
F 3 "" H 9550 5300 50  0001 C CNN
	1    9550 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD89583
P 9550 5850
F 0 "#PWR?" H 9550 5600 50  0001 C CNN
F 1 "GND" H 9555 5677 50  0000 C CNN
F 2 "" H 9550 5850 50  0001 C CNN
F 3 "" H 9550 5850 50  0001 C CNN
	1    9550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5300 9550 5400
Wire Wire Line
	9550 5400 9850 5400
Wire Wire Line
	9550 5850 9550 5750
Wire Wire Line
	9550 5750 9850 5750
Text GLabel 9850 5400 2    50   Output ~ 0
+5V
Text GLabel 9850 5750 2    50   Output ~ 0
0V
$Comp
L Device:R_Small R?
U 1 1 5FDC05A2
P 3650 6150
F 0 "R?" V 3454 6150 50  0000 C CNN
F 1 "47R" V 3545 6150 50  0000 C CNN
F 2 "" H 3650 6150 50  0001 C CNN
F 3 "~" H 3650 6150 50  0001 C CNN
	1    3650 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDC38B0
P 3650 5900
F 0 "#PWR?" H 3650 5750 50  0001 C CNN
F 1 "+5V" H 3665 6073 50  0000 C CNN
F 2 "" H 3650 5900 50  0001 C CNN
F 3 "" H 3650 5900 50  0001 C CNN
	1    3650 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5900 3650 6050
$Comp
L Device:LED D?
U 1 1 5FDCE490
P 3650 6550
F 0 "D?" V 3689 6432 50  0000 R CNN
F 1 "LED" V 3598 6432 50  0000 R CNN
F 2 "" H 3650 6550 50  0001 C CNN
F 3 "~" H 3650 6550 50  0001 C CNN
	1    3650 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 6400 3650 6250
$Comp
L power:GND #PWR?
U 1 1 5FDD7A21
P 3650 6900
F 0 "#PWR?" H 3650 6650 50  0001 C CNN
F 1 "GND" H 3655 6727 50  0000 C CNN
F 2 "" H 3650 6900 50  0001 C CNN
F 3 "" H 3650 6900 50  0001 C CNN
	1    3650 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6700 3650 6900
Text Notes 2250 6600 0    50   ~ 0
Assume this was an LED.\nThere are just two dangling wires.
Text Notes 6150 2550 0    50   ~ 0
Assume this was RESET_IN (non-inv)\nbut it was moved for some reason.\nShould be connected to 5v.
$EndSCHEMATC
