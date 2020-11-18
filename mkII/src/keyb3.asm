; vim: set ft=z8a:
; Keyboard Routing for Z80 MkII
org 0x0000
keyb_irq:
    ld  a,0xa7          ; Write to CTC Channel 0
    out (0x10),a
    in a,(0x02)         ; Read PIO1 Port B 
    xor 0xff            ; Invert bits
    jr z,end            ; Jump to end if no keys pressed
    ld c,0
    ld b,0x2f
loop1:                  ; Scan keyboard
    inc b
    out (c),b           ; Write to PIO1 Port A (set output on 1-of-10 decoder)
    in a,(0x02)         ; Read Port B
    xor 0xff            ; Invert bits
    jr z,loop1          ; Repeat until non-zero
    ld c,0xff
loop2:                  ; Shift A right until we get a carry
    inc c
    srl a
    jr nc, loop2
    ld a,b
    sub 0x30
    sla a
    sla a
    sla a
    add a,c
    ld c,a
    ld b,2
    ld a,0x2f
    out (0x00),a
    ld a,(bc)           ; Look-up key in table, ASCII value left in A
    rst 0x10            ; Call keyboard write routine
    ld a,0x97
    out (0x03),a        ; Write 0x97, 0x00 to PIO1, Port B ctrl reg.
    ld a,0
    out (0x03),a
    ld b,a
    ld a,(0xfeff)
    cp 0xff
    jr z,end
    ld hl,(0xfefc)
    ld (hl),b
    inc l
    ld (0xfefc),hl
    inc a
    ld (0xfeff),a
end:
    ret
