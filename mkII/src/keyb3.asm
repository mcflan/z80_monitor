; vim: set ft=z8a:

; Variables
.equ buf_used,  0xfeff
.equ start_lo,  0xfefe
.equ buf_hi,    0xfefd
.equ end_lo,    0xfefc

; IO Memory
.equ pio1_pa_data,  0x00
.equ pio1_pa_ctrl,  0x01
.equ pio1_pb_data,  0x02
.equ pio1_pb_ctrl,  0x03
.equ ctc_ch0,       0x10
.equ ctc_ch1,       0x11
.equ ctc_ch2,       0x12
.equ ctc_ch3,       0x13
.equ uart_data,     0x20
.equ uart_ctrl,     0x21
.equ disp_ctrl,     0x30
.equ disp_char,     0x31

; Reset vectors for subroutines

.text
.org 0x0000
reset:
    nop
    nop
    jp startup

equ disp_write_ctrl_rst, 0x08
.org disp_write_ctrl_rst
    jp disp_write_ctrl

equ disp_write_char_rst, 0x10
.org disp_write_char_rst
    jp disp_write_char

equ buf_get_rst, 0x18
.org buf_get_rst
    jp buf_get

.org 0x0040
    .hword pio_irq

org 0x0048
    .hword ctc_irq

startup:
    ld sp,0xfffe    ; Init stack pointer
    im 2            ; Set interrupt mode 2 (uses I)
    ei              ; Enable interrupts
    ld a,0x00       ; Interrupt vectors at 0x0000
    ld i,a
    ld a,0xcf       ; PIO PB to mode 3 (I/O ctrl mode)
    out (0x03),a
    ld a,0xff       ; Set all PB lines to inputs
    out (0x03),a
    ld a,0x2f       ; Set PA lines to 0x2f
    out (0x00),a
    out (0x01),a    ; Set PA as output
    ld a,0x40       ; Set PB interrupt vector
    out (0x03),a
    ld a,0x97       ; Enable ints, active low, OR logic, mask follows
    out (0x03),a
    ld a,0x00       ; Enable all pins
    out (0x03),a

    ld a,0x48       ; Set CTC interrupt vector to 0x48
    out (0x10),a
    ld a,0xa7       ; Set CTC Ch.0 to timer, prescale=256, free-run,
                    ; enable ints, time const follows.
    out (0x10),a
    ld a,0xff       ; Set buf to 0xffxx
    ld (buf_hi),a
    ld a,0x00
    ld (buf_used),a ; Init buf
    ld (start_lo),a
    ld (end_lo),a

                    ; Initialise the display
    ld a,0x0d
    rst disp_write_ctrl_rst
    ld a,0x20
    rst disp_write_ctrl_rst
    ld a,0x01
    rst disp_write_ctrl_rst
    ld a,0x0f
    rst disp_write_ctrl_rst

; Main loop. Gets a character from the buffer (can halt) and displays it.
get_char_loop:
    rst buf_get_rst
    rst disp_write_char_rst
    jr get_char_loop

pio_irq:
    ld a,0x03
    out (0x03),a
    ld a,0x39
    out (0x10),a
    ei
    reti

ctc_irq:
    ld a,0xa7
    out (0x10),a
    in a,(0x02)
    xor 0xff
    jr z, ctc_irq_cleanup
    ld c,0x00
    ld b,0x2f
ctc_irq_loop1:
    inc b
    out (c),b
    in a,(0x02)
    xor 0xff
    jr z,ctc_irq_loop1
    ld c,0xff
ctc_irq_loop2:
    inc c
    srl a
    jr nc,ctc_irq_loop2
    ld a,b
    sub 0x30
    sla a
    sla a
    sla a
    add a,c
    ld c,a
    ld b,0x02
    ld a,0x2f
    out (0x00),a
    ld a,(bc)       ; Look-up in keyboard table and place in buffer
    ld b,a
    ld a,(buf_used)
    cp 0xff
    jr z, ctc_irq_cleanup
    ld hl,(end_lo)
    ld (hl),b
    inc l
    ld (end_lo),hl
    inc a
    ld (buf_used),a
ctc_irq_cleanup:
    ld a,0x97
    out (0x03),a
    ld a,0x00
    out (0x03),a
    ei
    reti

disp_write_ctrl:
    push af
ctrl_check_busy:
    in a,(0x30)
    bit 7,a
    jr nz, check_busy
    pop af
    out (0x30),a
    ret

disp_write_char:
    push af
char_check_busy:
    in a,(0x30)
    bit 7,a
    jr nz, char_check_busy
    pop af
    out (0x31),a
    ret

buf_get:
    ld a,(buf_used)
    cp 0x00
    jr nz,buf_got_data
    halt                    ; Wait for int
    jr buf_get
buf_got_data:
    ld hl,(end_lo)
    ld b,a
    ld a,(start_lo)
    ld l,a
    ld c,(hl)
    inc a
    ld (start_lo),a
    ld a,b
    dec a
    ld (buf_used),a
    ld a,c
    ret

keyboard_table:
.data
.org 0x0200

    .byte  '1', 0x00, 0x1b, 0x00,  '9', 0x00,  'K', 0x00
    .byte  '2',  'Q',  'A',  'Z',  '0', 0x00,  'L', 0x88
    .byte  '3',  'W',  'S',  'X', 0x0f,  'I',  ';', 0x89
    .byte  '4',  'E',  'D',  'C', 0x00,  'O', 0x27, 0x00
    .byte  '5',  'R',  'F',  'V', 0x00,  'P', 0x0d,  ' '
    .byte  '6',  'T',  'G',  'B', 0x00,  '-',  ',', 0x8b
    .byte  '7',  'Y',  'H',  'N', 0x00,  '=',  '.', 0x8a
    .byte  '8',  'U',  'J',  'M', 0x00, 0x00,  '/', 0x00
    .byte  '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8'
    .byte  '9',  '0', 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00

    .byte 0x00,  '!',  '|', 0x08,  '@', 0x00, 0x10,  '`'
    .byte  '#', 0x18,  '$', 0x00,  ' ',  '%', 0x2f,  '('
    .byte  '^',  '~',  '0',  '&',  '{',  '8',  '*',  '}'
    .byte 0x04,  '(',  '[', 0x0c,  ')',  ']',  '-',  '_'
    .byte 0x00,  '5',  '+', 0x00, 0x16,  ':', 0x00, 0x1e
    .byte  '"', 0x00,  '.',  '<', 0x00,  '6',  '>', 0x00
    .byte  '>',  '?'
