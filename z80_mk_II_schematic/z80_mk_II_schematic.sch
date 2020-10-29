EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2850 2800 2100 2300
U 5F9960CD
F0 "Sheet5F9960CC" 50
F1 "cpu_mem_board.sch" 50
F2 "CPU_CLK" I L 2850 4650 50 
F3 "~INT~" I R 4950 4000 50 
F4 "~RD~" O R 4950 3600 50 
F5 "~WR~" O R 4950 3500 50 
F6 "~IORQ~" O R 4950 3400 50 
F7 "~M1~" O R 4950 3800 50 
F8 "D[7..0]" B R 4950 4100 50 
F9 "A[15..0]" O R 4950 3900 50 
F10 "IO_CLK" O R 4950 3700 50 
F11 "~RESET_IN~" I L 2850 4950 50 
F12 "~RESET~" O R 4950 3300 50 
F13 "IO_CLK_IN" I L 2850 4750 50 
F14 "~EXT_RESET~" I L 2850 4850 50 
$EndSheet
$Sheet
S 2850 5900 2050 1250
U 5F996C40
F0 "Sheet5F996C3F" 50
F1 "psu_board.sch" 50
F2 "~RESET~" O L 2850 6050 50 
F3 "~EXT_RESET~" I L 2850 6150 50 
F4 "IO_CLK" O L 2850 6250 50 
F5 "CPU_CLK" O L 2850 6350 50 
$EndSheet
$Sheet
S 6300 2800 2100 2300
U 5F996112
F0 "Sheet5F996111" 50
F1 "io_board.sch" 50
F2 "~M1~" I L 6300 3800 50 
F3 "~IORQ~" I L 6300 3400 50 
F4 "~RD~" I L 6300 3600 50 
F5 "~IOCLK~" I L 6300 3700 50 
F6 "~RESET~" I L 6300 3300 50 
F7 "~WR~" I L 6300 3500 50 
F8 "A[7..0]" I L 6300 3900 50 
F9 "D[7..0]" B L 6300 4100 50 
F10 "~INT~" B L 6300 4000 50 
$EndSheet
Wire Wire Line
	2850 6050 2600 6050
Wire Wire Line
	2600 6050 2600 4950
Wire Wire Line
	2600 4950 2850 4950
Wire Wire Line
	2850 6350 2300 6350
Wire Wire Line
	2300 6350 2300 4650
Wire Wire Line
	2300 4650 2850 4650
Wire Wire Line
	6300 3800 4950 3800
Wire Wire Line
	4950 3600 6300 3600
Wire Wire Line
	6300 3500 4950 3500
Wire Wire Line
	4950 3400 6300 3400
Wire Wire Line
	4950 4000 6300 4000
Wire Bus Line
	4950 4100 6300 4100
Wire Bus Line
	4950 3900 6300 3900
Wire Wire Line
	4950 3700 6300 3700
Wire Wire Line
	2850 4750 2400 4750
Wire Wire Line
	2400 4750 2400 6250
Wire Wire Line
	2400 6250 2850 6250
Wire Wire Line
	4950 3300 6300 3300
Wire Wire Line
	2850 4850 2500 4850
Wire Wire Line
	2500 4850 2500 6150
Wire Wire Line
	2500 6150 2850 6150
$EndSCHEMATC
