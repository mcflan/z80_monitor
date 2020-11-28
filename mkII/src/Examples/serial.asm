
; IO Memory
.equ ctc_ch0,       0x10
.equ ctc_ch1,       0x11
.equ ctc_ch2,       0x12
.equ ctc_ch3,       0x13
.equ uart_data,     0x20
.equ uart_ctrl,     0x21

; vim: set ft=z8a:
org 0x0000
.text
reset:
nop
nop
ld sp, 0x0200   ; Initialise stack pointer
di              ; Start with interrupts disabled
jp main

main:
    call uart_init
tx_msg_loop:
    ld hl, msg
tx_char_loop:
    ld a,(hl)           ; Get char from message
    cp 0                ; Message is NULL-terminated
    jr z,main    ; Keep sending same message
    call uart_tx_poll   ; Send it
    inc hl              ; Point to next char
    jr tx_char_loop     ; Rinse and repeat
end:
    halt


uart_init:
    ld a,0x05
    out (ctc_ch0),a
    ld a,125
    out (ctc_ch0),a

    ld a,0x45           ; Set CTC ch2 to counter mode, time const follows.
    out (ctc_ch2),a
                        ; Set time constant. Input is 2.4576MHz/4. CTC Output
                        ; is divided by 2. The UART internally divides by 16.
    ld a,2              ; So a time constant of 2 gives 9600 baud. The input
                        ; to the CTC is limited to half the system clock rate,
                        ; which is pretty crap really.
    out (ctc_ch2),a

    ld a,0x16           ; Configure UART. CLS1 and CLS2 set high => 8 bits
                        ; PI = 1 inhibits parity checking. 1 stop bit.
    out (uart_ctrl),a
    ret

uart_tx_poll:
    ld c,uart_ctrl      ; 7
    in b,(c)            ; 12 Get UART status
    bit 3,b             ; 8 Bit 3 is TBRE (tx buf reg empty)
    jr z,uart_tx_poll   ; 12,7 Wait for it to go high
    out (uart_data),a   ; Send data
    ret

.data
msg:
    .string "Z80 Mk II Computer. J.L.Macfarlane 1991,2021.\r\n"
    .byte 0x00
