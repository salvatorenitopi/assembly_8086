;CONSEGNA: 	Caricare una stringa da tastiera e visualizzarla a video

.model small

.stack 100h

.data
			str1	db 'MAX: ' , '$'
			str2	db 'MIN: ' , '$'
			
			vett byte 7,6,8,2,9,3,2,7,3,6,9,8
			massimo byte 0
			minimo byte 99
			ccc byte 0
.code
start:
			mov ax,@data
			mov ds,ax
			
			
			mov di,0
			call procedura

			
			mov dx, offset str1
			mov ah, 09h
			int 21h
			
			add massimo, 48
		
			mov dl, massimo
			mov ah,02h
			int 21h
			
			
			;------------------------------------------------------------------
			mov dl,10
			mov ah,02h
			int 21h
			mov dl,10
			mov ah,02h
			int 21h
			;------------------------------------------------------------------
			
		
			mov dx, offset str2
			mov ah, 09h
			int 21h
			
			add minimo,48
			
			mov dl, minimo
			mov ah,02h
			int 21h

			
			
			mov ah,01h				;simulo system pause
			int 21h
	
			
			mov ax,4c00h
			int 21h
			
			procedura:
			
					tmassimo:
								mov bx, offset vett
								mov al, [bx + di]
								
								cmp al,massimo
								jb nonmag
								
								mov massimo,al
								
								
									nonmag:
									
										inc di
										cmp di, lengthof vett
										jne tmassimo
			
					
					mov di,0
					
					tminimo:
					
								mov bx, offset vett
								mov al, [bx + di]
								
								cmp al,minimo
								ja nonmin
								
								mov minimo,al
								
								
									nonmin:
									
										inc di
										cmp di, lengthof vett
										jne tminimo
					ret		

			
			end start