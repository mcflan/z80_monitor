

FILES=main.hex display.hex serial.hex

TARGET=z80-unknown-coff-

all: $(FILES)

main.out: main.asm
#	$(TARGET)as $< -o $@

display.out: display.asm
#	$(TARGET)as $< -o $@

clean:
	rm -f $(FILES) *.o *.out

%.out: %.o
	$(TARGET)ld -Tz80_mkII.ld $< -o $@

%.o: %.asm
	$(TARGET)as --no-pad-sections $< -o $@

%.hex: %.out
	$(TARGET)objcopy -O ihex $< $@
