#!/bin/bash
#
TMP=$(mktemp z80)
z80-unknown-coff-objcopy --input-target=binary -B z80 --output-target=z80-unkown-coff  --image-base 0x0000 --rename-section .data=.text,contents,alloc,load,code $1 $TMP
z80-unknown-coff-objdump -d $TMP
rm $TMP

