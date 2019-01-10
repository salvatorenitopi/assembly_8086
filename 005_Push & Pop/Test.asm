.model small
.stack 100h

.data
stringa1 db 'Inserisci lettera:  ', '$'
stringa2 db 'Lettere inserite: ','$'


acapo byte 10d

.code
start:

mov ax, @data					;richiamo DATA
mov ds, ax

	mov ah,1h
	int 21h
	
	push ax
	
	mov ah,1h
	int 21h
	
	push ax

mov al,0

	pop ax
	
	mov dl,al
	mov ah,02h
	int 21h
	
	pop ax
	
	mov dl,al
	mov ah,02h
	int 21h



mov ah, 1h					;pause
int 21h

mov ax, 4c00h
int 21h
end start
