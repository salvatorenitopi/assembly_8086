.model small
.stack 100h

.data
	
	msg1 db 'Quanti N: ' ,'$'
	
	msg2 db 'Serie di Fibonacci: ' ,'$'
	
	numeri byte ?
	
	prec byte 0
	attuale byte 0
	risultato byte 0
	
.code
start: 

	mov ax,@data
	mov ds,ax
	
	
	mov dx, offset msg1
	mov ah, 09h
	int 21h
	
	mov ah, 1h
	int 21h
	
	sub al, 48
	
	mov numeri,al
	
	mov numeri, al
	
	mov prec,1
	mov attuale, 0
			
			fibonacci:
					
					mov al, prec
					mov bl, attuale
					add al,bl
					mov risultato, al
					
					mov prec,bl
					mov attuale, al
					
			
					dec numeri
					
					add attuale, 48
					
					mov dl, 10
					mov ah,02h
					int 21h
					
					mov dl, 10
					mov ah,02h
					int 21h
					
					mov dl, attuale
					mov ah,02h
					int 21h
					
					mov dl, 32
					mov ah,02h
					int 21h
					sub attuale, 48
					
					cmp numeri,0
					jne fibonacci

					
	
			
	
	
	
	mov ah,01h
	int 21h
	
	
	mov ax, 4c00h
	int 21h
	
end start