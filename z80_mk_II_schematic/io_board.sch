EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
L Interface:Z8420 U?
U 1 1 5FC165EB
P 2850 2550
F 0 "U?" H 2850 4031 50  0000 C CNN
F 1 "Z8420" H 2850 3940 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 2850 1150 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 2800 950 50  0001 C CNN
	1    2850 2550
	1    0    0    -1  
$EndComp
$Comp
L Interface:Z8420 U?
U 1 1 5FC1756B
P 8950 2550
F 0 "U?" H 8950 4031 50  0000 C CNN
F 1 "Z8420" H 8950 3940 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 8950 1150 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 8900 950 50  0001 C CNN
	1    8950 2550
	1    0    0    -1  
$EndComp
$Comp
L jm_Z80:Z80_CTC U?
U 1 1 60257463
P 4650 2550
F 0 "U?" H 4650 4031 50  0000 C CNN
F 1 "Z80_CTC" H 4650 3940 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm" H 4650 1150 50  0001 C CNN
F 3 "https://www.zilog.com/docs/z80/um0081.pdf" H 4600 950 50  0001 C CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Sheet
S 3500 4500 1650 1500
U 6029665D
F0 "Sheet6029665C" 50
F1 "baud_clock.sch" 50
F2 "CLK_OUT" O R 5150 5050 50 
F3 "DIV2_OUT" O R 5150 5400 50 
F4 "DIV2_IN" I R 5150 5250 50 
$EndSheet
Wire Wire Line
	5150 1950 5550 1950
Wire Wire Line
	5550 1950 5550 5250
Wire Wire Line
	5550 5250 5150 5250
Wire Wire Line
	5450 2900 5150 2900
Wire Wire Line
	5450 5050 5450 2900
Wire Wire Line
	5150 5050 5450 5050
$Sheet
S 6850 4350 1600 1850
U 6026683D
F0 "Sheet6026683C" 50
F1 "uart.sch" 50
F2 "TX_CLK" I L 6850 4900 50 
F3 "RX_CLK" I L 6850 5100 50 
F4 "D[7..0]" B L 6850 5450 50 
F5 "~INT~" T L 6850 5800 50 
F6 "~RD~" I L 6850 5900 50 
F7 "~UART_EN~" I L 6850 6100 50 
F8 "~WR~" I L 6850 6000 50 
F9 "A0" I L 6850 5550 50 
F10 "A1" I L 6850 5650 50 
$EndSheet
Wire Wire Line
	5150 5400 5750 5400
Wire Wire Line
	5750 5400 5750 5000
Wire Wire Line
	5750 5000 6750 5000
Wire Wire Line
	6750 5000 6750 5100
Wire Wire Line
	6750 5100 6850 5100
Wire Wire Line
	6850 4900 6750 4900
Wire Wire Line
	6750 4900 6750 5000
Connection ~ 6750 5000
$EndSCHEMATC
