; vim: set ft=z8a:
org 0x0000
.text
reset:
	nop
	nop
    ld sp, 0x0400   ; Initialise stack pointer
    di              ; Start with interrupts disabled
    jp main

main:
    ld a,80
    call wait_ms

    call lcd_init

    ld a,0
    or 0x80
    call wr_lcd_inst

	ld de,msg           ; Init msg pointer
    call send_msg

    ld a,20
    or 0x80
    call wr_lcd_inst
    halt


send_msg:
	ld a,(de)           ; Get data
	cp 0x00             ; It's NULL-terminated
	ret z
    call wr_lcd_data
	inc de              ; Point to next character in message
	jr send_msg

lcd_init:
    ld a,0x38           ; Set 8-bit mode, 2 lines
    call wr_lcd_inst_nochk
    ld a,2
    call wait
    ld a,0x38
    call wr_lcd_inst_nochk
    ld a,2
    call wait

    ld a,0x0f           ; Display on
    call wr_lcd_inst
    ld a,2
    call wait
    ld a,0x01           ; Clear the display
    call wr_lcd_inst
    ld a,2
    call wait_ms
    ld a,0x06           ; Set entry mode: inc cursor to right, don't scroll
    call wr_lcd_inst

    ld a,0x02           ; Return cursor to home
    call wr_lcd_inst
    ld a,2
    call wait_ms
    ret

wr_lcd_inst:
    ld b,a              ; Save A
	in a,(0x32)         ; Read LCD control word register
	bit 7,a             ; Check BUSY flag, MSB of register
	jr nz,wr_lcd_inst   ; Loop until not busy
    ld a,b              ; Restore A
wr_lcd_inst_nochk:
	out (0x30),a        ; Write LCD instruction register
    ret

wr_lcd_data:
    ld b,a              ; Save A
	in a,(0x32)         ; Read LCD control word register
	bit 7,a             ; Check BUSY flag, MSB of register
	jr nz,wr_lcd_data   ; Loop until not busy
    ld a,b              ; Restore A
	out (0x31),a        ; Write LCD instruction register
    ret

wait:                   ; call is 17 cycles
    inc a               ; 4
wait_loop:
    dec a               ; 4
    nop                 ; 4
    jp nz,wait_loop     ; 12 for jump, 7 when condition met
    ret                 ; 10
                        ; Total: 46 cycles plus 20*A
                        ; For 2MHz clock, 23us plus A*10us

; Busy-wait a precise number of milliseconds (assuming no
; interrupts and a 2MHz clock)
; If A=0, waits 35 cycles => 17.5us
; Waits for A ms minus 14 cycles to accomodate ld a,<some ms> and
; another operation.
wait_ms:                ; Call is 17 cycles
    cp 0                ; 7
    ret z               ; 5 if false (continue), 11 if true (ret)
    ld b,a              ; 4             
    ld a,47             ; 7
wait_ms_loop:
    dec a               ; 4
    jp nz,wait_ms_loop  ; 12 for jp, 7 when cond met
    dec b               ; 4
    ret z               ; 5 if false (continue), 11 if true (ret)
    ld a,48             ; 7
    ld a,48             ; 7 - for timing
    nop                 ; 4
    nop                 ; 4
    nop                 ; 4
    nop                 ; 4
    jp wait_ms_loop     ; 10


.data
msg:
    .string "Z80 Mk II                               J.L.Macfarlane 1991                     "
    .byte 0x00

