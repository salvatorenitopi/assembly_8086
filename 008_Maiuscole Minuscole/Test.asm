.model small
.stack 100h

.data

stringa db 'qUesTA StRiNGa e SbAlLaTa' , '$'
tempo byte ?

.code
start:

				mov ax,@data
				mov ds,ax
				
				mov di,0
				
		
	ricomincia:		
				
					mov bx, offset stringa
					mov al, [bx+di]
					mov tempo,al
					
					cmp tempo,97
					jae salto
					
					cmp tempo, 32
					je salto
					
					add tempo,32
					mov al,tempo
					mov [bx+di], al
					
			salto:	inc di
					cmp di, 25
					jne ricomincia
					
					
					mov dx, offset stringa
					mov ah, 09h
					int 21h
					
					mov ah, 01h
					int 21h
					
					
		



end start