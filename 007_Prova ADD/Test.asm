.model small
.stack 100h
.data
msg byte "Ciao a tutti", "$"
.code
start:
mov ax, @data
mov ds, ax
mov ah, 6
mov al, 0
mov ch, 0
mov cl, 0
mov dh, 24
mov dl, 79
mov bh, 1
int 10h
mov ah, 2
mov dx, 0714h
mov bh, 0
int 10h
mov dx, offset msg
mov ah, 9
int 21h
mov ah,1h
int 21h
mov ax, 4c00h
int 21h
end start