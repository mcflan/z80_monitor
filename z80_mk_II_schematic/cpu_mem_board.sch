EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5700 2800 6300 2800
$Comp
L Device:R_Small R2
U 1 1 5FBACC39
P 2200 1550
F 0 "R2" V 2300 1550 50  0000 C CNN
F 1 "4K7" V 2100 1550 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2200 1550 50  0001 C CNN
F 3 "~" H 2200 1550 50  0001 C CNN
	1    2200 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 4150 2350 4150
Text Label 1750 4050 0    50   ~ 0
~BUSRQ~
Wire Wire Line
	2350 1750 2100 1750
$Comp
L Device:R_Small R1
U 1 1 5FB8E85D
P 2000 1400
F 0 "R1" V 2100 1400 50  0000 C CNN
F 1 "4K7" V 1900 1400 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2000 1400 50  0001 C CNN
F 3 "~" H 2000 1400 50  0001 C CNN
	1    2000 1400
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5FB1C7F0
P 2500 1200
F 0 "#PWR03" H 2500 1050 50  0001 C CNN
F 1 "+5V" H 2515 1373 50  0000 C CNN
F 2 "" H 2500 1200 50  0001 C CNN
F 3 "" H 2500 1200 50  0001 C CNN
	1    2500 1200
	1    0    0    -1  
$EndComp
Text Label 1750 4150 0    50   ~ 0
~BUSAK~
Text Notes 6050 3250 0    50   ~ 0
/PGM should probably\nbe pulled-up?
Text Label 9750 2900 0    50   ~ 0
~WR~
Wire Wire Line
	9550 2900 9850 2900
Text Label 6500 3500 0    50   ~ 0
~RD~
Wire Wire Line
	6900 3500 6500 3500
Text Label 9750 2800 0    50   ~ 0
~RD~
Wire Wire Line
	9550 2800 9850 2800
Text Label 6200 2800 0    50   ~ 0
~RD~
Wire Wire Line
	3050 1200 3050 1450
$Comp
L power:+5V #PWR06
U 1 1 5FAEE61A
P 3050 1200
F 0 "#PWR06" H 3050 1050 50  0001 C CNN
F 1 "+5V" H 3065 1373 50  0000 C CNN
F 2 "" H 3050 1200 50  0001 C CNN
F 3 "" H 3050 1200 50  0001 C CNN
	1    3050 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1250 7300 1500
$Comp
L power:+5V #PWR020
U 1 1 5FAE9ED8
P 7300 1250
F 0 "#PWR020" H 7300 1100 50  0001 C CNN
F 1 "+5V" H 7315 1423 50  0000 C CNN
F 2 "" H 7300 1250 50  0001 C CNN
F 3 "" H 7300 1250 50  0001 C CNN
	1    7300 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1250 9050 1500
$Comp
L power:+5V #PWR026
U 1 1 5FAE5FFD
P 9050 1250
F 0 "#PWR026" H 9050 1100 50  0001 C CNN
F 1 "+5V" H 9065 1423 50  0000 C CNN
F 2 "" H 9050 1250 50  0001 C CNN
F 3 "" H 9050 1250 50  0001 C CNN
	1    9050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5FAE46DC
P 9050 3300
F 0 "#PWR027" H 9050 3050 50  0001 C CNN
F 1 "GND" H 9055 3127 50  0000 C CNN
F 2 "" H 9050 3300 50  0001 C CNN
F 3 "" H 9050 3300 50  0001 C CNN
	1    9050 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5FAE2EA1
P 3050 4450
F 0 "#PWR07" H 3050 4200 50  0001 C CNN
F 1 "GND" H 3055 4277 50  0000 C CNN
F 2 "" H 3050 4450 50  0001 C CNN
F 3 "" H 3050 4450 50  0001 C CNN
	1    3050 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5FAE2070
P 7300 3700
F 0 "#PWR021" H 7300 3450 50  0001 C CNN
F 1 "GND" H 7305 3527 50  0000 C CNN
F 2 "" H 7300 3700 50  0001 C CNN
F 3 "" H 7300 3700 50  0001 C CNN
	1    7300 3700
	1    0    0    -1  
$EndComp
Text Notes 3150 5400 0    50   ~ 0
/MON_WR can override RAM WR enable\ncircuit, since otherwise it would not be\npossible to write the code to enable the\nRAM (via the PIO) in the first place.
$Comp
L power:GND #PWR015
U 1 1 5FACE1E5
P 5200 3300
F 0 "#PWR015" H 5200 3050 50  0001 C CNN
F 1 "GND" H 5205 3127 50  0000 C CNN
F 2 "" H 5200 3300 50  0001 C CNN
F 3 "" H 5200 3300 50  0001 C CNN
	1    5200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1200 5200 1100
Connection ~ 5200 1200
Wire Wire Line
	5800 1200 5800 1300
Wire Wire Line
	5200 1200 5800 1200
Wire Wire Line
	5800 2900 5800 4550
Connection ~ 5800 2900
Wire Wire Line
	5800 1500 5800 2900
$Comp
L power:VMEM #PWR014
U 1 1 5FAB521E
P 5200 1100
F 0 "#PWR014" H 5200 950 50  0001 C CNN
F 1 "VMEM" H 5400 1200 50  0000 C CNN
F 2 "" H 5200 1100 50  0001 C CNN
F 3 "" H 5200 1100 50  0001 C CNN
	1    5200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1500 5200 1200
Wire Wire Line
	5400 4900 5550 4900
Connection ~ 5400 4900
Wire Wire Line
	5400 4500 4850 4500
Wire Wire Line
	5400 4900 5400 4500
Wire Wire Line
	5300 4900 5400 4900
Wire Wire Line
	4950 4900 4500 4900
Connection ~ 4950 4900
Wire Wire Line
	4950 5950 4950 4900
Wire Wire Line
	7550 5950 4950 5950
Wire Wire Line
	7550 5450 7550 5950
Wire Wire Line
	7450 5100 7450 5050
$Comp
L power:+5V #PWR022
U 1 1 5FA8934F
P 7450 5050
F 0 "#PWR022" H 7450 4900 50  0001 C CNN
F 1 "+5V" H 7465 5223 50  0000 C CNN
F 2 "" H 7450 5050 50  0001 C CNN
F 3 "" H 7450 5050 50  0001 C CNN
	1    7450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5450 7550 5450
Connection ~ 7450 5450
Wire Wire Line
	7450 5300 7450 5450
$Comp
L Device:R_Small R9
U 1 1 5FA8500D
P 7450 5200
F 0 "R9" H 7509 5246 50  0000 L CNN
F 1 "10K" H 7509 5155 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7450 5200 50  0001 C CNN
F 3 "~" H 7450 5200 50  0001 C CNN
	1    7450 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5450 7450 5450
Connection ~ 7300 5450
Wire Wire Line
	7300 5800 7300 5450
Wire Wire Line
	7200 5800 7300 5800
Wire Wire Line
	6900 5450 7000 5450
Connection ~ 6900 5450
Wire Wire Line
	6900 5800 6900 5450
Wire Wire Line
	7000 5800 6900 5800
$Comp
L Device:C_Small C5
U 1 1 5FA6D4FC
P 7100 5800
F 0 "C5" V 6871 5800 50  0000 C CNN
F 1 "47p" V 6962 5800 50  0000 C CNN
F 2 "" H 7100 5800 50  0001 C CNN
F 3 "~" H 7100 5800 50  0001 C CNN
	1    7100 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 5450 7300 5450
Wire Wire Line
	6850 5450 6900 5450
$Comp
L Device:R_Small R8
U 1 1 5FA6584E
P 7100 5450
F 0 "R8" V 7296 5450 50  0000 C CNN
F 1 "10K" V 7205 5450 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7100 5450 50  0001 C CNN
F 3 "~" H 7100 5450 50  0001 C CNN
	1    7100 5450
	0    -1   -1   0   
$EndComp
Text GLabel 7150 4450 2    50   Input ~ 0
RAM_WE?
Connection ~ 6900 4450
Wire Wire Line
	6900 4450 7150 4450
Wire Wire Line
	6900 4450 6900 4700
Wire Wire Line
	6850 4450 6900 4450
Wire Wire Line
	6900 4950 6900 4900
$Comp
L power:GND #PWR019
U 1 1 5FA5E5E8
P 6900 4950
F 0 "#PWR019" H 6900 4700 50  0001 C CNN
F 1 "GND" H 6905 4777 50  0000 C CNN
F 2 "" H 6900 4950 50  0001 C CNN
F 3 "" H 6900 4950 50  0001 C CNN
	1    6900 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5700 6000 5400
$Comp
L power:GND #PWR016
U 1 1 5FA5BF49
P 6000 5700
F 0 "#PWR016" H 6000 5450 50  0001 C CNN
F 1 "GND" H 6005 5527 50  0000 C CNN
F 2 "" H 6000 5700 50  0001 C CNN
F 3 "" H 6000 5700 50  0001 C CNN
	1    6000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5700 6550 5650
$Comp
L Device:R_Small R7
U 1 1 5FA56466
P 6900 4800
F 0 "R7" H 6841 4754 50  0000 R CNN
F 1 "4K7" H 6841 4845 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6900 4800 50  0001 C CNN
F 3 "~" H 6900 4800 50  0001 C CNN
	1    6900 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6550 4200 6550 4250
$Comp
L power:+5V #PWR017
U 1 1 5FA52A8E
P 6550 4200
F 0 "#PWR017" H 6550 4050 50  0001 C CNN
F 1 "+5V" H 6565 4373 50  0000 C CNN
F 2 "" H 6550 4200 50  0001 C CNN
F 3 "" H 6550 4200 50  0001 C CNN
	1    6550 4200
	1    0    0    -1  
$EndComp
Connection ~ 6550 5200
Wire Wire Line
	6550 4900 6550 5200
Wire Wire Line
	6550 4700 6550 4650
$Comp
L Device:R_Small R6
U 1 1 5FA4E196
P 6550 4800
F 0 "R6" H 6491 4754 50  0000 R CNN
F 1 "4K7" H 6491 4845 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6550 4800 50  0001 C CNN
F 3 "~" H 6550 4800 50  0001 C CNN
	1    6550 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5FA35676
P 5800 1400
F 0 "R4" H 5742 1354 50  0000 R CNN
F 1 "4K7" H 5742 1445 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5800 1400 50  0001 C CNN
F 3 "~" H 5800 1400 50  0001 C CNN
	1    5800 1400
	1    0    0    1   
$EndComp
$Comp
L Transistor_BJT:BC108 Q2
U 1 1 5FA4AA3A
P 6650 4450
F 0 "Q2" H 6841 4496 50  0000 L CNN
F 1 "BC108" H 6841 4405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-18-3" H 6850 4375 50  0001 L CIN
F 3 "http://www.b-kainka.de/Daten/Transistor/BC108.pdf" H 6650 4450 50  0001 L CNN
	1    6650 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 5200 6550 5250
Wire Wire Line
	6300 5200 6550 5200
Connection ~ 6000 4900
Wire Wire Line
	6000 4550 6000 4900
Wire Wire Line
	5800 4550 6000 4550
Wire Wire Line
	5700 2900 5800 2900
$Comp
L power:GND #PWR018
U 1 1 5FA30316
P 6550 5700
F 0 "#PWR018" H 6550 5450 50  0001 C CNN
F 1 "GND" H 6555 5527 50  0000 C CNN
F 2 "" H 6550 5700 50  0001 C CNN
F 3 "" H 6550 5700 50  0001 C CNN
	1    6550 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4900 6000 5000
Wire Wire Line
	5850 4900 6000 4900
Text Label 4500 4900 0    50   ~ 0
~WR
Wire Wire Line
	5000 4900 4950 4900
$Comp
L Diode:1N4148 D2
U 1 1 5FA100B7
P 5700 4900
F 0 "D2" H 5700 5117 50  0000 C CNN
F 1 "1N4148" H 5700 5026 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5700 4725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5700 4900 50  0001 C CNN
	1    5700 4900
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D1
U 1 1 5FA0F3B3
P 5150 4900
F 0 "D1" H 5150 4683 50  0000 C CNN
F 1 "1N4148" H 5150 4774 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5150 4725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5150 4900 50  0001 C CNN
	1    5150 4900
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:2N2219 Q3
U 1 1 5FA0D31D
P 6650 5450
F 0 "Q3" H 6841 5496 50  0000 L CNN
F 1 "2N2219" H 6841 5405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 6850 5375 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 6650 5450 50  0001 L CNN
	1    6650 5450
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 5FA0780E
P 6100 5200
F 0 "Q1" H 6291 5246 50  0000 L CNN
F 1 "2N2219" H 6291 5155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 6300 5125 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 6100 5200 50  0001 L CNN
	1    6100 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8400 3100 8550 3100
$Comp
L power:+5V #PWR025
U 1 1 5FA02B40
P 8400 3100
F 0 "#PWR025" H 8400 2950 50  0001 C CNN
F 1 "+5V" V 8415 3228 50  0000 L CNN
F 2 "" H 8400 3100 50  0001 C CNN
F 3 "" H 8400 3100 50  0001 C CNN
	1    8400 3100
	0    -1   -1   0   
$EndComp
Text Label 9600 2600 0    50   ~ 0
~RAM1_CE~
Wire Wire Line
	9550 2600 9850 2600
$Comp
L Memory_RAM:KM62256CLP U4
U 1 1 5F9D6B95
P 9050 2400
F 0 "U4" H 9050 2500 50  0000 C CNN
F 1 "KM62256CLP" H 9050 2350 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm_Socket" H 9050 2300 50  0001 C CNN
F 3 "https://www.futurlec.com/Datasheet/Memory/62256.pdf" H 9050 2300 50  0001 C CNN
	1    9050 2400
	1    0    0    -1  
$EndComp
Text Label 6450 3400 0    50   ~ 0
~EPROM_CE~
Wire Wire Line
	6500 3400 6900 3400
Text Label 6050 2600 0    50   ~ 0
~RAM0_CE~
$Comp
L Memory_EPROM:27128 U3
U 1 1 5F99F5A6
P 7300 2600
F 0 "U3" H 7350 2500 50  0000 C CNN
F 1 "27128" H 7350 2400 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm_Socket" H 7300 2600 50  0001 C CNN
F 3 "http://eeshop.unl.edu/pdf/27128.pdf" H 7300 2600 50  0001 C CNN
	1    7300 2600
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:KM62256CLP U2
U 1 1 5F996F7B
P 5200 2400
F 0 "U2" H 5200 2450 50  0000 C CNN
F 1 "KM62256CLP" H 5250 2300 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm_Socket" H 5200 2300 50  0001 C CNN
F 3 "https://www.futurlec.com/Datasheet/Memory/62256.pdf" H 5200 2300 50  0001 C CNN
	1    5200 2400
	1    0    0    -1  
$EndComp
$Comp
L CPU:Z80CPU U1
U 1 1 5F996352
P 3050 2950
F 0 "U1" H 3050 3050 50  0000 C CNN
F 1 "Z80CPU" H 3050 2850 50  0000 C CNN
F 2 "Housings_DIP:DIP-40_W15.24mm_Socket" H 3050 3350 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 3050 3350 50  0001 C CNN
	1    3050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4950 10900 4950
$Comp
L Device:R_Small R10
U 1 1 5F9E4D90
P 10150 4400
F 0 "R10" H 10209 4446 50  0000 L CNN
F 1 "4K7" H 10209 4355 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 10150 4400 50  0001 C CNN
F 3 "~" H 10150 4400 50  0001 C CNN
	1    10150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4500 10150 4750
Connection ~ 10150 4750
Wire Wire Line
	10050 4750 10150 4750
Wire Wire Line
	10150 4750 10900 4750
Connection ~ 10150 4250
Wire Wire Line
	10150 4250 10000 4250
Wire Wire Line
	10400 4250 10150 4250
Wire Wire Line
	10150 4250 10150 4300
$Comp
L power:+5V #PWR030
U 1 1 5F9E7202
P 10000 4150
F 0 "#PWR030" H 10000 4000 50  0001 C CNN
F 1 "+5V" H 10015 4323 50  0000 C CNN
F 2 "" H 10000 4150 50  0001 C CNN
F 3 "" H 10000 4150 50  0001 C CNN
	1    10000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4250 10000 4150
Text Notes 9850 6000 0    50   ~ 0
Note: EPROM ~CS Pull-up\nis missing, EPROM\nprobably never used.
Wire Wire Line
	10400 4250 10400 4300
Wire Wire Line
	10400 4850 10900 4850
Connection ~ 10400 4850
Wire Wire Line
	10400 4500 10400 4850
$Comp
L Device:R_Small R11
U 1 1 5F9E532E
P 10400 4400
F 0 "R11" H 10459 4446 50  0000 L CNN
F 1 "4K7" H 10459 4355 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 10400 4400 50  0001 C CNN
F 3 "~" H 10400 4400 50  0001 C CNN
	1    10400 4400
	1    0    0    -1  
$EndComp
Text Label 10550 4850 0    50   ~ 0
~RAM1_CE~
Text Label 10550 4750 0    50   ~ 0
~EPROM_CE~
Text Label 10550 4950 0    50   ~ 0
~RAM0_CE~
Wire Wire Line
	9950 4850 10400 4850
Connection ~ 9950 4850
Wire Wire Line
	9950 5550 9950 4850
Wire Wire Line
	9750 5550 9950 5550
Wire Wire Line
	9750 4850 9950 4850
Connection ~ 10050 4750
Wire Wire Line
	10050 5450 10050 4750
Wire Wire Line
	9750 5450 10050 5450
Wire Wire Line
	9750 4750 10050 4750
Wire Wire Line
	9850 5050 9850 4950
Connection ~ 9850 5050
Wire Wire Line
	9750 5050 9850 5050
Connection ~ 9850 5250
Wire Wire Line
	9850 5350 9850 5250
Wire Wire Line
	9750 5350 9850 5350
Connection ~ 9850 4950
Wire Wire Line
	9850 5250 9850 5050
Wire Wire Line
	9750 5250 9850 5250
Wire Wire Line
	9750 4950 9850 4950
Wire Wire Line
	7950 4500 7950 4850
Wire Wire Line
	8100 4500 7950 4500
Wire Wire Line
	7850 4700 7850 4400
Wire Wire Line
	8100 4700 7850 4700
$Comp
L Switch:SW_SPDT SW1
U 1 1 5F9A89E2
P 8300 4600
F 0 "SW1" H 8300 4885 50  0000 C CNN
F 1 "SW_SPDT" H 8300 4794 50  0000 C CNN
F 2 "" H 8300 4600 50  0001 C CNN
F 3 "~" H 8300 4600 50  0001 C CNN
	1    8300 4600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5F9BB130
P 9250 5850
F 0 "#PWR029" H 9250 5600 50  0001 C CNN
F 1 "GND" H 9255 5677 50  0000 C CNN
F 2 "" H 9250 5850 50  0001 C CNN
F 3 "" H 9250 5850 50  0001 C CNN
	1    9250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4150 9250 4450
Wire Wire Line
	8700 5300 8700 4850
Connection ~ 8700 5300
Wire Wire Line
	8250 5300 8700 5300
Wire Wire Line
	8700 4850 8750 4850
Wire Wire Line
	8700 5350 8700 5300
Wire Wire Line
	8750 5350 8700 5350
Connection ~ 8600 4750
Wire Wire Line
	8600 5450 8750 5450
Wire Wire Line
	8600 4750 8600 5450
Wire Wire Line
	8250 5150 8750 5150
Wire Wire Line
	8250 5050 8750 5050
$Comp
L power:+5V #PWR028
U 1 1 5F9AC23F
P 9250 4150
F 0 "#PWR028" H 9250 4000 50  0001 C CNN
F 1 "+5V" H 9265 4323 50  0000 C CNN
F 2 "" H 9250 4150 50  0001 C CNN
F 3 "" H 9250 4150 50  0001 C CNN
	1    9250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4750 8750 4750
Wire Wire Line
	8600 4600 8600 4750
Wire Wire Line
	8500 4600 8600 4600
$Comp
L power:GND #PWR024
U 1 1 5F9AAA2E
P 7950 4850
F 0 "#PWR024" H 7950 4600 50  0001 C CNN
F 1 "GND" H 7955 4677 50  0000 C CNN
F 2 "" H 7950 4850 50  0001 C CNN
F 3 "" H 7950 4850 50  0001 C CNN
	1    7950 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5F9A9F31
P 7850 4400
F 0 "#PWR023" H 7850 4250 50  0001 C CNN
F 1 "+5V" H 7865 4573 50  0000 C CNN
F 2 "" H 7850 4400 50  0001 C CNN
F 3 "" H 7850 4400 50  0001 C CNN
	1    7850 4400
	1    0    0    -1  
$EndComp
Text Label 8300 5150 0    50   ~ 0
A15
Text Label 8300 5050 0    50   ~ 0
A14
$Comp
L 74xx:74LS156 U5
U 1 1 5F99D220
P 9250 5150
F 0 "U5" H 9250 5300 50  0000 C CNN
F 1 "74LS156" H 9300 5150 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_Socket" H 9250 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS156" H 9250 5150 50  0001 C CNN
	1    9250 5150
	1    0    0    -1  
$EndComp
Text HLabel 1900 1750 0    50   Input ~ 0
~RESET_IN~
Text HLabel 1900 2050 0    50   Input ~ 0
CPU_CLK
Text HLabel 1900 2450 0    50   Input ~ 0
~INT~
Entry Wire Line
	4150 4050 4050 4150
Text Label 3900 4150 0    50   ~ 0
D7
Entry Wire Line
	4150 3950 4050 4050
Text Label 3900 4050 0    50   ~ 0
D6
Entry Wire Line
	4150 3850 4050 3950
Text Label 3900 3950 0    50   ~ 0
D5
Entry Wire Line
	4150 3750 4050 3850
Text Label 3900 3850 0    50   ~ 0
D4
Entry Wire Line
	4150 3650 4050 3750
Text Label 3900 3750 0    50   ~ 0
D3
Entry Wire Line
	4150 3550 4050 3650
Text Label 3900 3650 0    50   ~ 0
D2
Entry Wire Line
	4150 3450 4050 3550
Text Label 3900 3550 0    50   ~ 0
D1
Entry Wire Line
	4150 3350 4050 3450
Text Label 3900 3450 0    50   ~ 0
D0
Wire Wire Line
	3750 3250 3950 3250
Entry Wire Line
	4050 3150 3950 3250
Text Label 3800 3250 0    50   ~ 0
A15
Wire Wire Line
	3750 3150 3950 3150
Entry Wire Line
	4050 3050 3950 3150
Text Label 3800 3150 0    50   ~ 0
A14
Wire Wire Line
	3750 3050 3950 3050
Entry Wire Line
	4050 2950 3950 3050
Text Label 3800 3050 0    50   ~ 0
A13
Wire Wire Line
	3750 2950 3950 2950
Entry Wire Line
	4050 2850 3950 2950
Text Label 3800 2950 0    50   ~ 0
A12
Wire Wire Line
	3750 2850 3950 2850
Entry Wire Line
	4050 2750 3950 2850
Text Label 3800 2850 0    50   ~ 0
A11
Wire Wire Line
	3750 2750 3950 2750
Entry Wire Line
	4050 2650 3950 2750
Text Label 3800 2750 0    50   ~ 0
A10
Wire Wire Line
	3750 2650 3950 2650
Entry Wire Line
	4050 2550 3950 2650
Text Label 3800 2650 0    50   ~ 0
A9
Wire Wire Line
	3750 2550 3950 2550
Entry Wire Line
	4050 2450 3950 2550
Text Label 3800 2550 0    50   ~ 0
A8
Wire Wire Line
	3750 2450 3950 2450
Entry Wire Line
	4050 2350 3950 2450
Text Label 3800 2450 0    50   ~ 0
A7
Wire Wire Line
	3750 2350 3950 2350
Entry Wire Line
	4050 2250 3950 2350
Text Label 3800 2350 0    50   ~ 0
A6
Wire Wire Line
	3750 2250 3950 2250
Entry Wire Line
	4050 2150 3950 2250
Text Label 3800 2250 0    50   ~ 0
A5
Wire Wire Line
	3750 2150 3950 2150
Entry Wire Line
	4050 2050 3950 2150
Text Label 3800 2150 0    50   ~ 0
A4
Wire Wire Line
	3750 2050 3950 2050
Entry Wire Line
	4050 1950 3950 2050
Text Label 3800 2050 0    50   ~ 0
A3
Wire Wire Line
	3750 1950 3950 1950
Entry Wire Line
	4050 1850 3950 1950
Text Label 3800 1950 0    50   ~ 0
A2
Wire Wire Line
	3750 1850 3950 1850
Text Label 3800 1850 0    50   ~ 0
A1
Entry Wire Line
	4050 1750 3950 1850
Text Label 3800 1750 0    50   ~ 0
A0
Entry Wire Line
	4050 1650 3950 1750
Wire Wire Line
	3750 1750 3950 1750
Wire Wire Line
	3750 3450 4050 3450
Wire Wire Line
	3750 3550 4050 3550
Wire Wire Line
	3750 3650 4050 3650
Wire Wire Line
	3750 3750 4050 3750
Wire Wire Line
	3750 3850 4050 3850
Wire Wire Line
	3750 3950 4050 3950
Wire Wire Line
	3750 4050 4050 4050
Wire Wire Line
	3750 4150 4050 4150
Entry Bus Bus
	4050 800  4150 700 
Entry Bus Bus
	4150 1000 4250 900 
Wire Wire Line
	4700 3100 4500 3100
Entry Wire Line
	4400 3000 4500 3100
Text Label 4650 3100 2    50   ~ 0
A14
Wire Wire Line
	4700 3000 4500 3000
Entry Wire Line
	4400 2900 4500 3000
Text Label 4650 3000 2    50   ~ 0
A13
Wire Wire Line
	4700 2900 4500 2900
Entry Wire Line
	4400 2800 4500 2900
Text Label 4650 2900 2    50   ~ 0
A12
Wire Wire Line
	4700 2800 4500 2800
Entry Wire Line
	4400 2700 4500 2800
Text Label 4650 2800 2    50   ~ 0
A11
Wire Wire Line
	4700 2700 4500 2700
Entry Wire Line
	4400 2600 4500 2700
Text Label 4650 2700 2    50   ~ 0
A10
Wire Wire Line
	4700 2600 4500 2600
Entry Wire Line
	4400 2500 4500 2600
Text Label 4650 2600 2    50   ~ 0
A9
Wire Wire Line
	4700 2500 4500 2500
Entry Wire Line
	4400 2400 4500 2500
Text Label 4650 2500 2    50   ~ 0
A8
Wire Wire Line
	4700 2400 4500 2400
Entry Wire Line
	4400 2300 4500 2400
Text Label 4650 2400 2    50   ~ 0
A7
Wire Wire Line
	4700 2300 4500 2300
Entry Wire Line
	4400 2200 4500 2300
Text Label 4650 2300 2    50   ~ 0
A6
Wire Wire Line
	4700 2200 4500 2200
Entry Wire Line
	4400 2100 4500 2200
Text Label 4650 2200 2    50   ~ 0
A5
Wire Wire Line
	4700 2100 4500 2100
Entry Wire Line
	4400 2000 4500 2100
Text Label 4650 2100 2    50   ~ 0
A4
Wire Wire Line
	4700 2000 4500 2000
Entry Wire Line
	4400 1900 4500 2000
Text Label 4650 2000 2    50   ~ 0
A3
Wire Wire Line
	4700 1900 4500 1900
Entry Wire Line
	4400 1800 4500 1900
Text Label 4650 1900 2    50   ~ 0
A2
Wire Wire Line
	4700 1800 4500 1800
Text Label 4650 1800 2    50   ~ 0
A1
Entry Wire Line
	4400 1700 4500 1800
Text Label 4650 1700 2    50   ~ 0
A0
Entry Wire Line
	4400 1600 4500 1700
Wire Wire Line
	4700 1700 4500 1700
Entry Wire Line
	6100 2300 6000 2400
Text Label 5850 2400 0    50   ~ 0
D7
Entry Wire Line
	6100 2200 6000 2300
Text Label 5850 2300 0    50   ~ 0
D6
Entry Wire Line
	6100 2100 6000 2200
Text Label 5850 2200 0    50   ~ 0
D5
Entry Wire Line
	6100 2000 6000 2100
Text Label 5850 2100 0    50   ~ 0
D4
Entry Wire Line
	6100 1900 6000 2000
Text Label 5850 2000 0    50   ~ 0
D3
Entry Wire Line
	6100 1800 6000 1900
Text Label 5850 1900 0    50   ~ 0
D2
Entry Wire Line
	6100 1700 6000 1800
Text Label 5850 1800 0    50   ~ 0
D1
Entry Wire Line
	6100 1600 6000 1700
Text Label 5850 1700 0    50   ~ 0
D0
Wire Wire Line
	5700 1700 6000 1700
Wire Wire Line
	5700 1800 6000 1800
Wire Wire Line
	5700 1900 6000 1900
Wire Wire Line
	5700 2000 6000 2000
Wire Wire Line
	5700 2100 6000 2100
Wire Wire Line
	5700 2200 6000 2200
Wire Wire Line
	5700 2300 6000 2300
Wire Wire Line
	5700 2400 6000 2400
$Comp
L Device:R_Small R5
U 1 1 5FBD7BC5
P 6250 2100
F 0 "R5" H 6191 2054 50  0000 R CNN
F 1 "4K7" H 6191 2145 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6250 2100 50  0001 C CNN
F 3 "~" H 6250 2100 50  0001 C CNN
	1    6250 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 2600 5950 2600
Wire Wire Line
	6250 2200 6250 2450
Wire Wire Line
	6250 2450 5950 2450
Wire Wire Line
	5950 2450 5950 2600
Connection ~ 5950 2600
Wire Wire Line
	5950 2600 6400 2600
Wire Wire Line
	6900 3000 6700 3000
Entry Wire Line
	6600 2900 6700 3000
Text Label 6850 3000 2    50   ~ 0
A13
Wire Wire Line
	6900 2900 6700 2900
Entry Wire Line
	6600 2800 6700 2900
Text Label 6850 2900 2    50   ~ 0
A12
Wire Wire Line
	6900 2800 6700 2800
Entry Wire Line
	6600 2700 6700 2800
Text Label 6850 2800 2    50   ~ 0
A11
Wire Wire Line
	6900 2700 6700 2700
Entry Wire Line
	6600 2600 6700 2700
Text Label 6850 2700 2    50   ~ 0
A10
Wire Wire Line
	6900 2600 6700 2600
Entry Wire Line
	6600 2500 6700 2600
Text Label 6850 2600 2    50   ~ 0
A9
Wire Wire Line
	6900 2500 6700 2500
Entry Wire Line
	6600 2400 6700 2500
Text Label 6850 2500 2    50   ~ 0
A8
Wire Wire Line
	6900 2400 6700 2400
Entry Wire Line
	6600 2300 6700 2400
Text Label 6850 2400 2    50   ~ 0
A7
Wire Wire Line
	6900 2300 6700 2300
Entry Wire Line
	6600 2200 6700 2300
Text Label 6850 2300 2    50   ~ 0
A6
Wire Wire Line
	6900 2200 6700 2200
Entry Wire Line
	6600 2100 6700 2200
Text Label 6850 2200 2    50   ~ 0
A5
Wire Wire Line
	6900 2100 6700 2100
Entry Wire Line
	6600 2000 6700 2100
Text Label 6850 2100 2    50   ~ 0
A4
Wire Wire Line
	6900 2000 6700 2000
Entry Wire Line
	6600 1900 6700 2000
Text Label 6850 2000 2    50   ~ 0
A3
Wire Wire Line
	6900 1900 6700 1900
Entry Wire Line
	6600 1800 6700 1900
Text Label 6850 1900 2    50   ~ 0
A2
Wire Wire Line
	6900 1800 6700 1800
Text Label 6850 1800 2    50   ~ 0
A1
Entry Wire Line
	6600 1700 6700 1800
Text Label 6850 1700 2    50   ~ 0
A0
Entry Wire Line
	6600 1600 6700 1700
Wire Wire Line
	6900 1700 6700 1700
Entry Wire Line
	8000 2300 7900 2400
Text Label 7750 2400 0    50   ~ 0
D7
Entry Wire Line
	8000 2200 7900 2300
Text Label 7750 2300 0    50   ~ 0
D6
Entry Wire Line
	8000 2100 7900 2200
Text Label 7750 2200 0    50   ~ 0
D5
Entry Wire Line
	8000 2000 7900 2100
Text Label 7750 2100 0    50   ~ 0
D4
Entry Wire Line
	8000 1900 7900 2000
Text Label 7750 2000 0    50   ~ 0
D3
Entry Wire Line
	8000 1800 7900 1900
Text Label 7750 1900 0    50   ~ 0
D2
Entry Wire Line
	8000 1700 7900 1800
Text Label 7750 1800 0    50   ~ 0
D1
Entry Wire Line
	8000 1600 7900 1700
Text Label 7750 1700 0    50   ~ 0
D0
Wire Wire Line
	7700 1700 7900 1700
Wire Wire Line
	7700 1800 7900 1800
Wire Wire Line
	7700 1900 7900 1900
Wire Wire Line
	7700 2000 7900 2000
Wire Wire Line
	7700 2100 7900 2100
Wire Wire Line
	7700 2200 7900 2200
Wire Wire Line
	7700 2300 7900 2300
Wire Wire Line
	7700 2400 7900 2400
Entry Wire Line
	9850 2300 9750 2400
Text Label 9600 2400 0    50   ~ 0
D7
Entry Wire Line
	9850 2200 9750 2300
Text Label 9600 2300 0    50   ~ 0
D6
Entry Wire Line
	9850 2100 9750 2200
Text Label 9600 2200 0    50   ~ 0
D5
Entry Wire Line
	9850 2000 9750 2100
Text Label 9600 2100 0    50   ~ 0
D4
Entry Wire Line
	9850 1900 9750 2000
Text Label 9600 2000 0    50   ~ 0
D3
Entry Wire Line
	9850 1800 9750 1900
Text Label 9600 1900 0    50   ~ 0
D2
Entry Wire Line
	9850 1700 9750 1800
Text Label 9600 1800 0    50   ~ 0
D1
Entry Wire Line
	9850 1600 9750 1700
Text Label 9600 1700 0    50   ~ 0
D0
Wire Wire Line
	9550 1700 9750 1700
Wire Wire Line
	9550 1800 9750 1800
Wire Wire Line
	9550 1900 9750 1900
Wire Wire Line
	9550 2000 9750 2000
Wire Wire Line
	9550 2100 9750 2100
Wire Wire Line
	9550 2200 9750 2200
Wire Wire Line
	9550 2300 9750 2300
Wire Wire Line
	9550 2400 9750 2400
Entry Bus Bus
	9850 1000 9950 900 
Wire Wire Line
	8550 3000 8350 3000
Entry Wire Line
	8250 2900 8350 3000
Text Label 8500 3000 2    50   ~ 0
A13
Wire Wire Line
	8550 2900 8350 2900
Entry Wire Line
	8250 2800 8350 2900
Text Label 8500 2900 2    50   ~ 0
A12
Wire Wire Line
	8550 2800 8350 2800
Entry Wire Line
	8250 2700 8350 2800
Text Label 8500 2800 2    50   ~ 0
A11
Wire Wire Line
	8550 2700 8350 2700
Entry Wire Line
	8250 2600 8350 2700
Text Label 8500 2700 2    50   ~ 0
A10
Wire Wire Line
	8550 2600 8350 2600
Entry Wire Line
	8250 2500 8350 2600
Text Label 8500 2600 2    50   ~ 0
A9
Wire Wire Line
	8550 2500 8350 2500
Entry Wire Line
	8250 2400 8350 2500
Text Label 8500 2500 2    50   ~ 0
A8
Wire Wire Line
	8550 2400 8350 2400
Entry Wire Line
	8250 2300 8350 2400
Text Label 8500 2400 2    50   ~ 0
A7
Wire Wire Line
	8550 2300 8350 2300
Entry Wire Line
	8250 2200 8350 2300
Text Label 8500 2300 2    50   ~ 0
A6
Wire Wire Line
	8550 2200 8350 2200
Entry Wire Line
	8250 2100 8350 2200
Text Label 8500 2200 2    50   ~ 0
A5
Wire Wire Line
	8550 2100 8350 2100
Entry Wire Line
	8250 2000 8350 2100
Text Label 8500 2100 2    50   ~ 0
A4
Wire Wire Line
	8550 2000 8350 2000
Entry Wire Line
	8250 1900 8350 2000
Text Label 8500 2000 2    50   ~ 0
A3
Wire Wire Line
	8550 1900 8350 1900
Entry Wire Line
	8250 1800 8350 1900
Text Label 8500 1900 2    50   ~ 0
A2
Wire Wire Line
	8550 1800 8350 1800
Text Label 8500 1800 2    50   ~ 0
A1
Entry Wire Line
	8250 1700 8350 1800
Text Label 8500 1700 2    50   ~ 0
A0
Entry Wire Line
	8250 1600 8350 1700
Wire Wire Line
	8550 1700 8350 1700
Entry Bus Bus
	8250 800  8350 700 
Entry Bus Bus
	8000 1000 8100 900 
Entry Bus Bus
	6600 800  6700 700 
Entry Bus Bus
	4400 800  4500 700 
Entry Bus Bus
	6100 1000 6200 900 
Text HLabel 1900 3450 0    50   Output ~ 0
~RD~
Text HLabel 1900 3550 0    50   Output ~ 0
~WR~
Text HLabel 1900 3750 0    50   Output ~ 0
~IORQ~
Wire Wire Line
	1900 3750 2350 3750
Wire Wire Line
	2350 3550 1900 3550
Wire Wire Line
	2350 3450 1900 3450
Wire Wire Line
	2050 3650 2350 3650
Text Label 2050 3650 0    50   ~ 0
~MREQ~
Text Label 8250 5300 0    50   ~ 0
~MREQ~
Text Label 4850 4500 0    50   ~ 0
~MON_WR~
Wire Wire Line
	2350 2750 1900 2750
Text HLabel 1900 2750 0    50   Output ~ 0
~M1~
Wire Wire Line
	1750 4050 2150 4050
$Comp
L Device:R_Small R3
U 1 1 5FB205D8
P 2250 4650
F 0 "R3" H 2191 4604 50  0000 R CNN
F 1 "4K7" H 2191 4695 50  0000 R CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2250 4650 50  0001 C CNN
F 3 "~" H 2250 4650 50  0001 C CNN
	1    2250 4650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5FB37C3D
P 2250 4550
F 0 "#PWR02" H 2250 4400 50  0001 C CNN
F 1 "+5V" V 2265 4678 50  0000 L CNN
F 2 "" H 2250 4550 50  0001 C CNN
F 3 "" H 2250 4550 50  0001 C CNN
	1    2250 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4750 2250 4800
Wire Wire Line
	2250 4800 2150 4800
Wire Wire Line
	2150 4800 2150 4050
Connection ~ 2150 4050
Wire Wire Line
	2150 4050 2350 4050
Wire Wire Line
	1900 2050 2350 2050
Wire Wire Line
	2000 1300 2000 1250
Wire Wire Line
	2000 1250 2200 1250
Wire Wire Line
	2500 1250 2500 1200
Wire Wire Line
	2200 1450 2200 1250
Connection ~ 2200 1250
Wire Wire Line
	2200 1250 2500 1250
Wire Wire Line
	2000 1500 2000 2350
Wire Wire Line
	2000 2350 2350 2350
Wire Wire Line
	1900 2450 2200 2450
Wire Wire Line
	2200 1650 2200 2450
Connection ~ 2200 2450
Wire Wire Line
	2200 2450 2350 2450
Wire Wire Line
	2100 1750 2100 1900
Wire Wire Line
	2100 1900 1900 1900
Connection ~ 2100 1750
Wire Wire Line
	2100 1750 1900 1750
Text HLabel 1900 1900 0    50   Output ~ 0
~RESET~
Text HLabel 10450 900  2    50   BiDi ~ 0
D[7..0]
Text HLabel 10450 700  2    50   Output ~ 0
A[15..0]
Entry Bus Bus
	1200 800  1300 700 
Entry Wire Line
	1200 2400 1100 2500
Text Label 950  2500 0    50   ~ 0
A1
Wire Wire Line
	900  2400 1100 2400
Entry Wire Line
	1200 2300 1100 2400
Text Label 950  2400 0    50   ~ 0
A2
Wire Wire Line
	900  2300 1100 2300
Entry Wire Line
	1200 2200 1100 2300
Text Label 950  2300 0    50   ~ 0
A3
Wire Wire Line
	900  2200 1100 2200
Entry Wire Line
	1200 2100 1100 2200
Text Label 950  2200 0    50   ~ 0
A4
Wire Wire Line
	900  2100 1100 2100
Entry Wire Line
	1200 2000 1100 2100
Text Label 950  2100 0    50   ~ 0
A5
Wire Wire Line
	900  2000 1100 2000
Entry Wire Line
	1200 1900 1100 2000
Text Label 950  2000 0    50   ~ 0
A6
Wire Wire Line
	900  1900 1100 1900
Entry Wire Line
	1200 1800 1100 1900
Text Label 950  1900 0    50   ~ 0
A7
Entry Wire Line
	1200 2500 1100 2600
Wire Wire Line
	900  1700 1100 1700
Entry Wire Line
	1200 1600 1100 1700
Text Label 950  1700 0    50   ~ 0
A8
Wire Wire Line
	900  1600 1100 1600
Entry Wire Line
	1200 1500 1100 1600
Text Label 950  1600 0    50   ~ 0
A9
Wire Wire Line
	900  1500 1100 1500
Entry Wire Line
	1200 1400 1100 1500
Text Label 950  1500 0    50   ~ 0
A10
Wire Wire Line
	900  1400 1100 1400
Entry Wire Line
	1200 1300 1100 1400
Text Label 950  1400 0    50   ~ 0
A11
Wire Wire Line
	900  1300 1100 1300
Entry Wire Line
	1200 1200 1100 1300
Text Label 950  1300 0    50   ~ 0
A12
Wire Wire Line
	900  1200 1100 1200
Entry Wire Line
	1200 1100 1100 1200
Text Label 950  1200 0    50   ~ 0
A13
Wire Wire Line
	900  1100 1100 1100
Text Label 950  1100 0    50   ~ 0
A14
Entry Wire Line
	1200 1000 1100 1100
Text Label 950  1000 0    50   ~ 0
A15
Entry Wire Line
	1200 900  1100 1000
Wire Wire Line
	900  1000 1100 1000
Wire Wire Line
	900  2500 1100 2500
Text Label 950  2600 0    50   ~ 0
A0
Wire Wire Line
	900  2600 1100 2600
Entry Bus Bus
	1500 900  1400 1000
Entry Wire Line
	1400 2700 1300 2800
Text Label 950  2800 0    50   ~ 0
D7
Wire Wire Line
	900  2800 1300 2800
Entry Wire Line
	1400 2800 1300 2900
Text Label 950  2900 0    50   ~ 0
D6
Wire Wire Line
	900  2900 1300 2900
Entry Wire Line
	1400 2900 1300 3000
Text Label 950  3000 0    50   ~ 0
D5
Wire Wire Line
	900  3000 1300 3000
Entry Wire Line
	1400 3000 1300 3100
Text Label 950  3100 0    50   ~ 0
D4
Wire Wire Line
	900  3100 1300 3100
Entry Wire Line
	1400 3100 1300 3200
Text Label 950  3200 0    50   ~ 0
D3
Wire Wire Line
	900  3200 1300 3200
Entry Wire Line
	1400 3200 1300 3300
Text Label 950  3300 0    50   ~ 0
D2
Wire Wire Line
	900  3300 1300 3300
Entry Wire Line
	1400 3300 1300 3400
Text Label 950  3400 0    50   ~ 0
D1
Wire Wire Line
	900  3400 1300 3400
Entry Wire Line
	1400 3400 1300 3500
Text Label 950  3500 0    50   ~ 0
D0
Wire Wire Line
	900  3500 1300 3500
Wire Wire Line
	900  3600 1200 3600
Wire Wire Line
	900  3700 1200 3700
Text Label 950  3600 0    50   ~ 0
~RD~
Text Label 950  3700 0    50   ~ 0
~MON_WR~
Wire Wire Line
	900  3800 1200 3800
Wire Wire Line
	900  3900 1000 3900
Text Label 950  3800 0    50   ~ 0
~MREQ~
Text Label 950  4000 0    50   ~ 0
NC
$Comp
L power:GND #PWR01
U 1 1 6016FD6B
P 1300 4200
F 0 "#PWR01" H 1300 3950 50  0001 C CNN
F 1 "GND" H 1305 4027 50  0000 C CNN
F 2 "" H 1300 4200 50  0001 C CNN
F 3 "" H 1300 4200 50  0001 C CNN
	1    1300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4100 1300 4200
Wire Wire Line
	900  4100 1300 4100
Wire Wire Line
	900  1800 1100 1800
Wire Wire Line
	900  2700 1200 2700
Text Label 950  2700 0    50   ~ 0
~BUSAK~
Text Label 900  1800 0    50   ~ 0
~BUSRQ~
Text Label 950  4200 0    50   ~ 0
NC
Text Label 950  4300 0    50   ~ 0
NC
Text Label 950  4400 0    50   ~ 0
NC
$Comp
L Connector:Conn_01x37_Male J1
U 1 1 601C9BCA
P 700 2800
F 0 "J1" H 808 4689 50  0000 C CNN
F 1 "Conn_01x37_Male" H 808 4690 50  0001 C CNN
F 2 "" H 700 2800 50  0001 C CNN
F 3 "~" H 700 2800 50  0001 C CNN
	1    700  2800
	1    0    0    -1  
$EndComp
Text Label 950  4500 0    50   ~ 0
NC
Text Label 950  4600 0    50   ~ 0
NC
Wire Wire Line
	1500 5150 2300 5150
Text HLabel 2300 5150 2    50   Output ~ 0
IO_CLK
Text HLabel 1500 5150 0    50   Input ~ 0
IO_CLK_IN
Text HLabel 1000 3900 2    50   Input ~ 0
~EXT_RESET~
Wire Wire Line
	5800 1200 6250 1200
Wire Wire Line
	6250 1200 6250 2000
Connection ~ 5800 1200
$Comp
L Device:C_Small C1
U 1 1 60359873
P 3000 6000
F 0 "C1" V 2771 6000 50  0000 C CNN
F 1 "0u1" V 2862 6000 50  0000 C CNN
F 2 "" H 3000 6000 50  0001 C CNN
F 3 "~" H 3000 6000 50  0001 C CNN
	1    3000 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6035A8B2
P 3000 6100
F 0 "#PWR05" H 3000 5850 50  0001 C CNN
F 1 "GND" H 3005 5927 50  0000 C CNN
F 2 "" H 3000 6100 50  0001 C CNN
F 3 "" H 3000 6100 50  0001 C CNN
	1    3000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 6035B940
P 3000 5900
F 0 "#PWR04" H 3000 5750 50  0001 C CNN
F 1 "+5V" H 3015 6073 50  0000 C CNN
F 2 "" H 3000 5900 50  0001 C CNN
F 3 "" H 3000 5900 50  0001 C CNN
	1    3000 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 6035ED0A
P 3800 6000
F 0 "C3" V 3571 6000 50  0000 C CNN
F 1 "0u1" V 3662 6000 50  0000 C CNN
F 2 "" H 3800 6000 50  0001 C CNN
F 3 "~" H 3800 6000 50  0001 C CNN
	1    3800 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 6035ED10
P 3800 6100
F 0 "#PWR011" H 3800 5850 50  0001 C CNN
F 1 "GND" H 3805 5927 50  0000 C CNN
F 2 "" H 3800 6100 50  0001 C CNN
F 3 "" H 3800 6100 50  0001 C CNN
	1    3800 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 6035ED16
P 3800 5900
F 0 "#PWR010" H 3800 5750 50  0001 C CNN
F 1 "+5V" H 3815 6073 50  0000 C CNN
F 2 "" H 3800 5900 50  0001 C CNN
F 3 "" H 3800 5900 50  0001 C CNN
	1    3800 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 60379DCA
P 4200 6000
F 0 "C4" V 3971 6000 50  0000 C CNN
F 1 "0u1" V 4062 6000 50  0000 C CNN
F 2 "" H 4200 6000 50  0001 C CNN
F 3 "~" H 4200 6000 50  0001 C CNN
	1    4200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 60379DD0
P 4200 6100
F 0 "#PWR013" H 4200 5850 50  0001 C CNN
F 1 "GND" H 4205 5927 50  0000 C CNN
F 2 "" H 4200 6100 50  0001 C CNN
F 3 "" H 4200 6100 50  0001 C CNN
	1    4200 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 60379DD6
P 4200 5900
F 0 "#PWR012" H 4200 5750 50  0001 C CNN
F 1 "+5V" H 4215 6073 50  0000 C CNN
F 2 "" H 4200 5900 50  0001 C CNN
F 3 "" H 4200 5900 50  0001 C CNN
	1    4200 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60395B39
P 3400 6100
F 0 "#PWR09" H 3400 5850 50  0001 C CNN
F 1 "GND" H 3405 5927 50  0000 C CNN
F 2 "" H 3400 6100 50  0001 C CNN
F 3 "" H 3400 6100 50  0001 C CNN
	1    3400 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 60395B3F
P 3400 5900
F 0 "#PWR08" H 3400 5750 50  0001 C CNN
F 1 "+5V" H 3415 6073 50  0000 C CNN
F 2 "" H 3400 5900 50  0001 C CNN
F 3 "" H 3400 5900 50  0001 C CNN
	1    3400 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 60593521
P 3400 6000
F 0 "C2" V 3150 5950 50  0000 L CNN
F 1 "100u" V 3250 5900 50  0000 L CNN
F 2 "" H 3400 6000 50  0001 C CNN
F 3 "~" H 3400 6000 50  0001 C CNN
	1    3400 6000
	1    0    0    -1  
$EndComp
Wire Bus Line
	1500 900  10450 900 
Wire Bus Line
	1300 700  10450 700 
Wire Bus Line
	1400 1000 1400 3400
Wire Bus Line
	9850 1000 9850 2300
Wire Bus Line
	8000 1000 8000 2300
Wire Bus Line
	6100 1000 6100 2300
Wire Bus Line
	4150 1000 4150 4050
Wire Bus Line
	4400 800  4400 3000
Wire Bus Line
	6600 800  6600 2900
Wire Bus Line
	8250 800  8250 2900
Wire Bus Line
	1200 800  1200 2500
Wire Bus Line
	4050 800  4050 3150
$EndSCHEMATC
