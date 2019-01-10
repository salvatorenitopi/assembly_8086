.model small
.stack 100h

.data
stringa1 db 'Ciao a tutti', '$'
stringa2 db  'Stringa 2','$'
stringa3 db 'Chiamata', '$'


acapo byte 10d

.code
start:

mov ax, @data
mov ds, ax


mov dx, offset stringa1			;Stampa stringa
mov ah, 9h
int 21h


mov dl, acapo					;acapo
mov ah, 2h
int 21h

call LOPR

mov dx, offset stringa2			;Stampa stringa
mov ah, 9h
int 21h

call LOPR


mov dx, offset stringa1			;Stampa stringa
mov ah, 9h
int 21h

call LOPR


mov ah, 1h					;pause
int 21h

mov ax, 4c00h
int 21h

LOPR:

mov dx, offset stringa3			;Stampa stringa
mov ah, 9h
int 21h

ret

end start
