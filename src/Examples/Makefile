

FILES=main.hex

TARGET=z80-unknown-coff-

all: $(FILES)

main.out: main.asm
	$(TARGET)as $< -o $@

clean:
	rm -f $(FILES) *.o *.out

%.hex: %.out
	$(TARGET)objcopy -O ihex $< $@
