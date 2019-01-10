.model small
.stack 100h
.data
istr db 'Carattere M: $'
ostr db 'Carattere m: $'
.code
start:
mov ax, @data
mov ds, ax
mov dx, offset istr
call puts
call getc
mov bl, al
add bl, 32d
call put1310
mov dx, offset ostr
call puts
mov dl, bl
call putc
mov ah, 1h
int 21h
mov ax, 4c00h
int 21h
; subroutine getc
getc:
mov ah, 1h
int 21h
ret
; subroutint putc
putc:
mov ah, 2h
int 21h
ret
; subroutine puts
puts:
mov ah, 9h
int 21h
ret
; subroutine put1310
put1310:
mov dl, 13d
mov ah, 2h
int 21h
mov dl, 10d
mov ah, 2h
int 21h
ret
end start