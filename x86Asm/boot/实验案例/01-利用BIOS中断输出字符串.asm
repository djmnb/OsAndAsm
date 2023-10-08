[org 0x7c00]
; 设置屏幕模式为文本模式，清除屏幕

mov ax, 3
int 0x10

mov ax,cs
mov ds,ax
mov ss,ax
mov es,ax
mov sp,0x7c00

xchg bx,bx



mov ax,0x1301
mov cx, messageEnd-message
mov dx,0
mov bp,message

mov bx, 0x7

int 0x10





  

; 阻塞
jmp $

message:
    db "hello world"
messageEnd:

; 填充 0
times 510 - ($ - $$) db 0

; 主引导扇区的最后两个字节必须是 0x55 0xaa
; dw 0xaa55
db 0x55, 0xaa