EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L 74xx:74LS04 U?
U 1 1 602A193D
P 3350 3650
AR Path="/5F996112/6026683D/602A193D" Ref="U?"  Part="1" 
AR Path="/5F996112/6029665D/602A193D" Ref="U?"  Part="1" 
F 0 "U?" H 3350 3967 50  0000 C CNN
F 1 "74LS04" H 3350 3876 50  0000 C CNN
F 2 "" H 3350 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3350 3650 50  0001 C CNN
	1    3350 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 602A1943
P 4350 3650
AR Path="/5F996112/6026683D/602A1943" Ref="U?"  Part="2" 
AR Path="/5F996112/6029665D/602A1943" Ref="U?"  Part="2" 
F 0 "U?" H 4350 3967 50  0000 C CNN
F 1 "74LS04" H 4350 3876 50  0000 C CNN
F 2 "" H 4350 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4350 3650 50  0001 C CNN
	2    4350 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 602A1949
P 5250 3650
AR Path="/5F996112/6026683D/602A1949" Ref="U?"  Part="3" 
AR Path="/5F996112/6029665D/602A1949" Ref="U?"  Part="3" 
F 0 "U?" H 5250 3967 50  0000 C CNN
F 1 "74LS04" H 5250 3876 50  0000 C CNN
F 2 "" H 5250 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5250 3650 50  0001 C CNN
	3    5250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 602A194F
P 3850 3650
AR Path="/5F996112/6026683D/602A194F" Ref="C?"  Part="1" 
AR Path="/5F996112/6029665D/602A194F" Ref="C?"  Part="1" 
F 0 "C?" V 3621 3650 50  0000 C CNN
F 1 "10n" V 3712 3650 50  0000 C CNN
F 2 "" H 3850 3650 50  0001 C CNN
F 3 "~" H 3850 3650 50  0001 C CNN
	1    3850 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3650 3700 3650
Wire Wire Line
	3950 3650 4000 3650
$Comp
L Device:R_Small R?
U 1 1 602A1957
P 3300 4050
AR Path="/5F996112/6026683D/602A1957" Ref="R?"  Part="1" 
AR Path="/5F996112/6029665D/602A1957" Ref="R?"  Part="1" 
F 0 "R?" V 3496 4050 50  0000 C CNN
F 1 "1K0" V 3405 4050 50  0000 C CNN
F 2 "" H 3300 4050 50  0001 C CNN
F 3 "~" H 3300 4050 50  0001 C CNN
	1    3300 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 4050 3000 4050
Wire Wire Line
	3000 4050 3000 3650
Wire Wire Line
	3000 3650 3050 3650
Wire Wire Line
	3400 4050 3700 4050
Wire Wire Line
	3700 4050 3700 3650
Connection ~ 3700 3650
Wire Wire Line
	3700 3650 3650 3650
$Comp
L Device:R_Small R?
U 1 1 602A1964
P 4300 4050
AR Path="/5F996112/6026683D/602A1964" Ref="R?"  Part="1" 
AR Path="/5F996112/6029665D/602A1964" Ref="R?"  Part="1" 
F 0 "R?" V 4496 4050 50  0000 C CNN
F 1 "1K0" V 4405 4050 50  0000 C CNN
F 2 "" H 4300 4050 50  0001 C CNN
F 3 "~" H 4300 4050 50  0001 C CNN
	1    4300 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 4050 4000 4050
Wire Wire Line
	4000 4050 4000 3650
Connection ~ 4000 3650
Wire Wire Line
	4000 3650 4050 3650
Wire Wire Line
	4400 4050 4700 4050
Wire Wire Line
	4700 4050 4700 3650
Wire Wire Line
	4700 3650 4650 3650
Wire Wire Line
	4700 3650 4750 3650
Connection ~ 4700 3650
$Comp
L Device:C_Small C?
U 1 1 602A1973
P 4850 3900
AR Path="/5F996112/6026683D/602A1973" Ref="C?"  Part="1" 
AR Path="/5F996112/6029665D/602A1973" Ref="C?"  Part="1" 
F 0 "C?" H 4942 3946 50  0000 L CNN
F 1 "47p" H 4942 3855 50  0000 L CNN
F 2 "" H 4850 3900 50  0001 C CNN
F 3 "~" H 4850 3900 50  0001 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3800 4850 3650
Connection ~ 4850 3650
Wire Wire Line
	4850 3650 4950 3650
$Comp
L power:GND #PWR?
U 1 1 602A197C
P 4850 4100
AR Path="/5F996112/6026683D/602A197C" Ref="#PWR?"  Part="1" 
AR Path="/5F996112/6029665D/602A197C" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 4850 3850 50  0001 C CNN
F 1 "GND" H 4855 3927 50  0000 C CNN
F 2 "" H 4850 4100 50  0001 C CNN
F 3 "" H 4850 4100 50  0001 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4100 4850 4000
$Comp
L Device:Crystal Y?
U 1 1 602A1983
P 3850 3200
AR Path="/5F996112/6026683D/602A1983" Ref="Y?"  Part="1" 
AR Path="/5F996112/6029665D/602A1983" Ref="Y?"  Part="1" 
F 0 "Y?" H 3850 3468 50  0000 C CNN
F 1 "2.4576MHz" H 3850 3377 50  0000 C CNN
F 2 "" H 3850 3200 50  0001 C CNN
F 3 "~" H 3850 3200 50  0001 C CNN
	1    3850 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3200 3000 3200
Wire Wire Line
	3000 3200 3000 3650
Connection ~ 3000 3650
Wire Wire Line
	4000 3200 4750 3200
Wire Wire Line
	4750 3200 4750 3650
Connection ~ 4750 3650
Wire Wire Line
	4750 3650 4850 3650
$Comp
L 74xx:74LS197 U?
U 1 1 602A1990
P 6450 3350
AR Path="/5F996112/6026683D/602A1990" Ref="U?"  Part="1" 
AR Path="/5F996112/6029665D/602A1990" Ref="U?"  Part="1" 
F 0 "U?" H 6450 4331 50  0000 C CNN
F 1 "74LS197" H 6450 4240 50  0000 C CNN
F 2 "" H 6450 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS197" H 6450 3350 50  0001 C CNN
	1    6450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3650 5950 3650
$Comp
L power:+5V #PWR0132
U 1 1 602A26C4
P 6450 2250
F 0 "#PWR0132" H 6450 2100 50  0001 C CNN
F 1 "+5V" H 6465 2423 50  0000 C CNN
F 2 "" H 6450 2250 50  0001 C CNN
F 3 "" H 6450 2250 50  0001 C CNN
	1    6450 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0133
U 1 1 602A3344
P 5750 3250
F 0 "#PWR0133" H 5750 3100 50  0001 C CNN
F 1 "+5V" H 5765 3423 50  0000 C CNN
F 2 "" H 5750 3250 50  0001 C CNN
F 3 "" H 5750 3250 50  0001 C CNN
	1    5750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3350 5750 3350
Wire Wire Line
	5750 3350 5750 3250
Wire Wire Line
	6450 2550 6450 2250
$Comp
L power:GND #PWR?
U 1 1 602A41F4
P 6450 4150
AR Path="/5F996112/6026683D/602A41F4" Ref="#PWR?"  Part="1" 
AR Path="/5F996112/6029665D/602A41F4" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 6450 3900 50  0001 C CNN
F 1 "GND" H 6455 3977 50  0000 C CNN
F 2 "" H 6450 4150 50  0001 C CNN
F 3 "" H 6450 4150 50  0001 C CNN
	1    6450 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3850 5750 3850
Wire Wire Line
	5750 3850 5750 3350
Connection ~ 5750 3350
Wire Wire Line
	5950 3550 5850 3550
Wire Wire Line
	5850 3550 5850 4550
Wire Wire Line
	5850 4550 7450 4550
Wire Wire Line
	6950 3150 7450 3150
Text HLabel 7450 3150 2    50   Output ~ 0
CLK_OUT
Wire Wire Line
	6950 2850 7450 2850
Text HLabel 7450 2850 2    50   Output ~ 0
DIV2_OUT
Text HLabel 7450 4550 2    50   Input ~ 0
DIV2_IN
$EndSCHEMATC
