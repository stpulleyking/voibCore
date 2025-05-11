[org 0x7c00]

start:
    call clear_screen

.loop:
    call wait_key
    call draw_raw
    jmp .loop

wait_key:
    mov ah, 0
    int 0x16       ; read key to AL
    ret

draw_raw:
    mov ah, 0x0E   ; teletype BIOS output
    mov bh, 0x00
    mov bl, 0x07   ; light gray on black
    int 0x10
    ret

clear_screen:
    mov ah, 0x06
    mov al, 0
    mov bh, 0x07
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10
    ret

times 510 - ($ - $$) db 0
dw 0xAA55
