# Notes on monitor implementation


## Commands

  - b - claim bus, begin view (see 'v') if active
  - B - release bus, stops view, if active
  - txxxx <enter> - set address top reg to hex value xxxx
  - gxxxx <enter> - set address reg G (current byte pointer) to hex value xxxx ("go")
  - l - increment G by one
  - h - decrement G by one
  - j - increment G by 16
  - k - decrement G by 16
  - L - increment G by 256
  - H - decrement G by 256
  - J - increment G by 4096
  - K - decrement G by 4096
  - i - turn on auto address increment
  - I - turn off auto address increment
  - x - hexadecimal data entry, two hex digits per byte until <enter> or
    <escape> pressed.
  - wn - decimal (strtol-style, so hex allowed as 0x....) data entry where n is
    word length in bytes. Numbers must be space-separated. Continues until
    <enter> or <esacpe> pressed.
  - s - string (ASCII) data entry. Continues until <escape> (ASCII 0x1b)
    pressed.
  - o - overwrite existing data
  - O - insert data - shifts everything as up as far as the B address, drops
    byte at B. B must be > G.
  - :..<enter>. - enter Intel Hex record
  - S...<enter> - enter SREC record
  - m - select main memory
  - M - select I/O memory
  - D - delete a byte - shifts everything down from the B address to G,
    duplicates byte at B. B must be > G.
  - R - repeat - i.e. enter a byte the same as the next lower one in memory.
  - p - print byte at G (will auto increment if set, see 'i')
  - fnf - format for printing. 'n' sets word length, 'F' sets format as per printf.
  - v - view on - show address and 16 bytes of data per line, 16 lines per page at approx 10 Hz update rate.
  - V - view off.
  - Wi - "write" (dump to terminal) Intel hex data from current address (precede with desired count)
  - Ws - As above, but "writes" SREC data.

Some commands can be prefixed with a decimal number, and will repeat that command that number of times.
