#
# To set actuation radius during build to something other than 1500m, do this:
#
#     make CPPFLAGS=-DACTUATION_RADIUS=3000.
#
# Actuation altitude will be set to same unless explicitly set to something
# different.

AVRDUDE_CPU=m328p -F
AVRGCC_CPU=atmega328p

#PROGRAMMER=jtag2isp
PROGRAMMER=avrisp2

GIT_VERSION := $(shell git rev-parse --short HEAD)
GIT_DATE := $(shell git show -s --format="%ci" HEAD)

CC=avr-gcc
#CPPFLAGS=-DDEBUG
#CPPFLAGS=-DTESTMODE
#CPPFLAGS=-DTESTMODE -DFIXTEST
#CPPFLAGS=-DGPSTEST
override CPPFLAGS+=-DGIT_VERSION=\"$(GIT_VERSION)\" -DGIT_DATE="\"$(GIT_DATE)\"" -DSERIAL_NR=$(SERIAL_NR)
CFLAGS=-g -Os -Wall -mcall-prologues -mmcu=$(AVRGCC_CPU)
#LDFLAGS=-Wl,-u,vfprintf,-Map,mapfile.map
LDFLAGS=-Wl,-u,vfprintf
LOADLIBES=-lm -lprintf_flt
OBJ2HEX=avr-objcopy 
UISP=uisp 
TARGETS=monitor

all : $(TARGETS)

.PHONY: monitor
monitor: monitor.hex monitor.lst


prog: monitor.hex
	avrdude -p $(AVRDUDE_CPU) -B9 -P usb  -c $(PROGRAMMER) -U flash:w:$<

reset:
	avrdude -p $(AVRDUDE_CPU) -B9 -P usb  -c $(PROGRAMMER)

fuses:
	avrdude -v -p $(AVRDUDE_CPU) -B9 -P usb  -c $(PROGRAMMER) -U lfuse:w:0xFF:m -U hfuse:w:0xDF:m -U efuse:w:0xff:m
 
monitor.obj: monitor.o uart.o cdev.o timer.o hexify.o poll.o


%.lst : %.obj
	avr-objdump -S $^ > $@

%.obj : %.o
	$(CC) $(LDFLAGS) $(CFLAGS) $^ -o $@ $(LOADLIBES)
	avr-size $@

%.hex : %.obj
	$(OBJ2HEX) -R .eeprom -O ihex $< $@

clean :
	rm -f *.hex *.obj *.o *.lst *.map
