;CONSEGNA:  Dati due vettori di numeri interi lunghi uguali, caricare un terzo
			;vettore moltiplicando gli elementi dei vettori precedenti
			;con indici uguali

.model small
.stack 100h

.data

		msg1 db 'Vettore finale:  ','$'

		vett1 byte 1,2,3
		vett2 byte 1,2,3
		vett3 byte 0,0,0
		cont byte 0
		
		app1 byte 0
		app2 byte 0
		
		prod byte 0

.code

 	start:
	 		mov ax,@data
	 		mov ds,ax
	 		
	 		mov di, 0								;Azzero di (contatore array)
			mov cont, 0b							;Azzero cont (contatore ciclo)
	 		
	 		
	 		
		
	sez1:	
			mov app1,0
			mov app1,0
		
			mov bx, offset vett1
			mov al, [bx + di]							;copio su al il vettore alla posizione "di"
			mov app1,al							;copio al su app1
			
			mov bx, offset vett2
			mov al, [bx + di]							;copio su al il vettore alla posizione "di"
			mov app2,al							;copio al su app1
			
			mov al, app1							;copio il valore di app1 su al
			mul app2								;moltiplico AL * app2, (app2 viene sovrascritta con il risultato)
			mov app2, al							;copio il valore di app2 su al
			
			mov bx, offset vett3
			mov [bx + di], al							;scrivo sul vettore3 alla posizione "di"
			
			inc di								;Incremento di (contatore array)
			inc cont								;Incremento cont (contatore ciclo)
			
			cmp cont, 3							;se cont non è uguale a tre ritorna a sez1
			jne sez1
			;end sez1
			
			
			mov di, 0								;Azzero di (contatore array)
			mov cont, 0							;Azzero cont (contatore ciclo)
			
			mov dx,offset msg1						;stampo msg1
			mov ah,9h
			int 21h
			
	sez2:	
			mov bx,offset vett3
			mov al, [bx + di]							;leggo alla posizione "di"
			
			add al, 48
			
			mov dl,al								;stampo contenuto al
			mov ah,2h
			int 21h
			
			inc di								;Incremento di (contatore array)
			inc cont								;Incremento cont (contatore ciclo)
			
			cmp cont,3							;se cont non è uguale a tre ritorna a sez2
			jne sez2
			;end sez2
			
	 		
	 		mov ah,1h								;simulo system pause
	 		int 21h
	 		
	 		mov ax, 4c00h							;chiusura del programma
	 		int 21h
	 		end start