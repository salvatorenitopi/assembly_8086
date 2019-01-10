.model small
.stack 100h

.data
	
	msg1 db 'Inserisci il valore: ','$'
	msg2 db 'Il suo quadrato e: ','$'
	
	valore byte 0

.code
start: 

	mov ax,@data
	mov ds,ax
	
	
	mov dx, offset msg1
	mov ah, 09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov valore, al			;copio carattere acquisito su valore
	
	sub valore, 48			;sottraggo 48 per portarlo a numerico (ascii)
	
	mov al,valore			;metto valore in AL ( AL =  primo operando MUL )
	
	mul valore				;lo moltiplico per se stesso ( Secondo operando MUL )
	
	mov valore,al			;copio il risultato su valore ( RISULTATO  MUL )
	
	mov dl, 10				;acapo
	mov ah, 02h
	int 21h
			
	mov dx, offset msg2
	mov ah, 09h
	int 21h
	
	add valore,48			;aggiungo 48 per portarlo a caratteri (ascii)
	
	mov dl, valore			;stampo valore
	mov ah, 02h
	int 21h
			
	
	
	
	mov ah,01h
	int 21h
	
	
	mov ax, 4c00h
	int 21h
	
end start