.model small
.stack 100h

.data
	
	msg1 db 'Dividendo: ','$'
	msg2 db 'Divisore: ','$'
	msg3 db 'Risultato','$'
	
	dividendo byte 0
	divisore byte 0
	temp byte 0
	risultato byte 0

.code
start: 

	mov ax,@data
	mov ds,ax
	
	
	mov dx, offset msg1
	mov ah, 09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov dividendo, al			
	
	mov dl, 10			
	mov ah, 02h
	int 21h
	
	mov dx, offset msg2
	mov ah, 09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov divisore, al
	
	sub dividendo, 48
	sub divisore, 48

	mov cl,0
	mov dl,divisore
	
	divisione:		
				
				
				sub dividendo, dl
				
				inc cl
				
				cmp cl,divisore
				jne divisione
	
	
	
	mov dl, 10			
	mov ah, 02h
	int 21h
	
	mov dl, 10			
	mov ah, 02h
	int 21h
			
	mov dx, offset msg3
	mov ah, 09h
	int 21h
	
	add risultato,48			
	
	mov dl, risultato			
	mov ah, 02h
	int 21h
			
	
	
	
	mov ah,01h
	int 21h
	
	
	mov ax, 4c00h
	int 21h
	
end start