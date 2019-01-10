.model small
.stack 100h

.data 

	msg1 db 'Inserisci una stringa di 10 caratteri: ','$'
	msg2 db 'La stringa inserita e: ','$'
	
	stringa db 420 dup (0)
	
.code
start:
mov ax,@data
mov ds, ax
		
		mov dx, offset msg1
				mov ah, 09h
				int 21h
				
				mov dl, 10
				mov ah, 02h
				int 21h
				
				mov di,0

		ciclo:
				mov ah,01h
				int 21h
				
				mov bx, offset stringa
				mov [bx + di] ,al
				
				inc di
				
				cmp di,10
				je esci
				
				jmp ciclo


		
		esci:		
		
				mov dl, 10
				mov ah, 02h
				int 21h
				
				mov dl, 10
				mov ah, 02h
				int 21h
				
				mov dl, 10
				mov ah, 02h
				int 21h
		
				mov dx, offset msg2
				mov ah, 09h
				int 21h
				
				mov dl, 10
				mov ah, 02h
				int 21h
		
				mov dx, offset stringa
				mov ah, 09h
				int 21h
		
		
mov ah,01h
int 21h

mov ax, 4c00h
int 21h
end start