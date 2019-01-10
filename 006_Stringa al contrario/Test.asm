;CONSEGNA: 	Caricare una stringa da tastiera e visualizzarla a video

.model small

.stack 100h

.data
	
			msg1 db 'Inserisci una parola lunga 7 lettere: ','$'
			msg2 db 'La parola che hai inserito e: ','$'
			stringa db ?
			
.code
	
	start:
			mov ax, @data
			mov ds,ax
			
			mov dx, offset msg1	;stampo msg1
			mov ah, 9h
			int 21h
			
			mov di,0		;azzero di (contatore array)
			
			
	sez1:
			mov ah,1h
			int 21h
			
			push ax
			
			
			inc di
		
			
			cmp di,7
			jne sez1
			;end sez1
			
			mov dl,10		;vado a capo
			mov ah,2h
			int 21h
			
			mov dl,10		;vado a capo
			mov ah,2h
			int 21h
	
			mov dx, offset msg2	;stampo msg2
			mov ah, 9h
			int 21h
			
			
			mov di,0		;azzero di (contatore array)
	
	sez2:		
			pop ax
			
			mov dl,al		;stampo singola lettera
			mov ah,2h
			int 21h
			
			inc di				;incremento di
			
			cmp di,7			;se non è uguale a 7 torna a sez2
			jne sez2
			;end sez2
			
			
			mov ah,1h			;simula system pause
			int 21h
			
			mov ax,4c00h
			int 21h
			end start
			
			
		;nota: per stampare la stringa letta da tastiera ho usato un altro ciclo (sez2) perchè 
		;stampandola con MOV DX, offset stringa / MOV AH, 9h / INT 21h avrei stampato
		;tutta la stringa e non solo i primi 7 caratteri (quelli digitati da me)