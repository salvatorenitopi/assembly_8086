.model small
.stack 100h

.data 

	msg1 db 'Terzo ARRAY: ' ,'$'

	arr1 byte 2,3,1
	arr2 byte 2,3,1	
	arr3 byte 0,0,0
	
	app1 byte ?
	app2 byte ?


	
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
		
				mov app1,0
				mov app2,0
		
				mov bx, offset arr1
				mov al,  [bx + di]
				mov app1, al
				
				mov bx, offset arr2
				mov al,  [bx + di]
				mov app2, al
				
				mov al,app1
				mul app2
				
				mov app2,al
					
					
				
				mov bx, offset arr3
				mov [bx + di], al
				
				
				inc di
				
				cmp di, 3
				jne ciclo
				
				
				mov di, 0
				
		stampa:	
				mov bx, offset arr3
				mov al, [bx+di]
				
				cmp al, 10
				ja salta
				
				add al, 48
				
					mov dl, al
					mov ah, 02h
					int 21h
				
		
		salta:	inc di
				cmp di, 3
				jne stampa
				
				
				
				

				
				
				
				
		
		
mov ah,01h
int 21h

mov ax, 4c00h
int 21h
end start