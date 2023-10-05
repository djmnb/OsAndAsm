[org 0x7c00]
; 设置屏幕模式为文本模式，清除屏幕
mov ax, 3
int 0x10

xchg bx,bx



  

; 阻塞
jmp $


; 填充 0
times 510 - ($ - $$) db 0

; 主引导扇区的最后两个字节必须是 0x55 0xaa
; dw 0xaa55
db 0x55, 0xaa