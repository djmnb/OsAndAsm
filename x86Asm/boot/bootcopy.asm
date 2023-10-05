[org 0x7c00]
; 设置屏幕模式为文本模式，清除屏幕
mov ax, 3
int 0x10

xchg bx,bx

; 初始化段寄存器
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov si, 0

; 屏幕显示区域
mov ax,0xb800
mov es,ax
mov di,0

mov ax,0
mov ds,ax
mov si,message

; 显示字符H

showMessage:
    mov cl,[si]
    jcxz showMessageEnd

    mov [es:di],cl
    add di,2
    add si,1

    jmp showMessage

showMessageEnd:
    

; 阻塞
jmp $

message:
    db "hello world",0
messageEnd:

; 填充 0
times 510 - ($ - $$) db 0

; 主引导扇区的最后两个字节必须是 0x55 0xaa
; dw 0xaa55



db 0x55, 0xaa