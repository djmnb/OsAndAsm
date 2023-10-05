[org 0x7c00]
; 设置屏幕模式为文本模式，清除屏幕
mov ax, 3
int 0x10

xchg bx,bx

mov ax,0
mov ds,ax
mov ss,ax
mov sp,0x7c00

mov word [0x80*4],print
mov word [0x80*4+2],0

int 0x80




    

; 阻塞
jmp $

print:
    mov si,message
    push ax
    mov ax,0xb800
    mov es,ax
    pop ax
    mov di,0

printStart:
    mov cl,[si]
    jcxz printEnd

    mov [es:di],cl
    inc si
    add di,2

    jmp printStart

printEnd:
    iret
    

message:
    db "hello world",0
messageEnd:

; 填充 0
times 510 - ($ - $$) db 0

; 主引导扇区的最后两个字节必须是 0x55 0xaa
; dw 0xaa55



db 0x55, 0xaa