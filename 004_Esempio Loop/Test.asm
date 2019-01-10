.model small
.stack 100h
.data
str1 byte "Stringa da copiare","0"
str2 byte sizeof str1 dup(0)
.code
start:
mov si, 0
mov cx, sizeof str1
L1:
mov al, str1[si]
mov str2[si], al
inc si
loop L1
mov ah,1h
int 21h
mov ax, 4c00h
int 21h
end start