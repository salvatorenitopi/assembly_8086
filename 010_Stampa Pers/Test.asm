.model small
.stack 100h

.data
		msg1 db 'Inserisci una stringa: ','$'
		msg2 db 'La tua stringa e: ','$'
		
		
		sinput db ?
		soutput db ?

		cont byte 0
.code
start:
		mov ax,@data
		mov ds,ax
		
			mov di,0
			mov cont,0
			
			mov dx, offset msg1
			mov ah, 09h
			int 21h
			
			salva:
				
				mov ah,01h
				int 21h
				
				mov bx, offset sinput
				mov [bx+di], al
				
				cmp al, 13
				je fine1
				
				inc di
				inc cont
				
				jne salva
				
				
				
				
		
			fine1:
			
					mov di,0
					
					mov dl,10
					mov ah,02h
					int 21h
					
					mov dl,10
					mov ah,02h
					int 21h
					
					mov dx, offset msg2
					mov ah, 09h
					int 21h
					
					mov dl,10
					mov ah,02h
					int 21h
				
			scrivi: 	
					mov bx, offset sinput
					mov al, [bx+di]
					
					cmp al, 13
					je fine2
					
					cmp al, 9
					jne nontab
					
					mov dl,10
					mov ah,02h
					int 21h
					inc di
					jmp scrivi
					
			
			nontab:	mov dl,al
					mov ah,02h
					int 21h
					inc di
					jmp scrivi	
				
			fine2:
		
				mov ah,01h
				int 21h
				
		
		mov ax,4c00h
		int 21h
		end start