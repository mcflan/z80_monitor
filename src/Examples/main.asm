; vim: set ft=z8a:
org 0x0000
reset:
    jp startup

org 0x0066
nmi:
    reti

org 0x0080
startup:
    di                  ; Disable interupts
    ld SP, 0x0200       ; Initialise stack pointer
    jp main
main:
    ld A, 0x0f
    out (0x01), A
    ld DE, 0x0001
    ld HL, 0x0000
    ld BC, 0x0000
inc_hl:
    adc HL, DE
    jr NC, skip_carry
    inc BC
skip_carry:
    ld  (0x0004), HL
    ld  (0x0006), BC
    ld A, L
    out (0x00),A
    ld A, C
    cp 0x04
    jr NZ, inc_hl
    nop
    nop
    halt
    jr main

