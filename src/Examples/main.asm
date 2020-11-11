; vim: set ft=z8a:
org 0x0000
reset:
    di                  ; Disable interupts
    jr start

org 0x0006
start:
    ld A, 0x0f
    out (0x01), A
    ld HL, 0x0000
inc_hl:
    ld  (0x0004), HL
    inc HL
    ld A, L
    out (0x00),A
    jr inc_hl
    nop
    nop
    halt

