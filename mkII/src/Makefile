

FILES=keyb3.hex

TARGET=z80-unknown-coff-

all: $(FILES)

keyb3.out: keyb3.asm
	$(TARGET)as $< -o $@

clean:
	rm -f $(FILES) *.o *.out

%.hex: %.out
	$(TARGET)objcopy -O ihex $< $@
