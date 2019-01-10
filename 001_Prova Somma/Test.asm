.model small
.stack 100h

.data
stringa1 db 'Inserisci il primo operando: ', '$'
stringa2 db  'Inserisci il secondo operando: ','$'
stringa3 db 'Il risultato e: ', '$'

var1 byte '0d'
var2 byte '0d'
var3 byte '0d'

acapo byte 10d

.code
start:

mov ax, @data					;richiamo DATA
mov ds, ax



mov dx, offset stringa1			;Stampa stringa
mov ah, 9h
int 21h

mov ah, 1h					;lettura da tastiera
int 21h

mov var1,al					;salvo primo valore in var1

mov dl, acapo					;acapo
mov ah, 2h
int 21h

mov dl, acapo					;acapo
mov ah, 2h
int 21h

mov dx, offset stringa2			;Stampa stringa
mov ah, 9h
int 21h

mov ah, 1h					;lettura da tastiera
int 21h

mov var2,al					;salvo primo valore in var2
                        
                        
mov bl, var1					;eseguo la somma
add bl,var2
mov var3,bl

mov dl, acapo					;acapo
mov ah, 2h
int 21h

mov dl, acapo					;acapo
mov ah, 2h
int 21h


mov dx, offset stringa3			;Stampa stringa
mov ah, 9h
int 21h


mov bl, var3					;sottraggo 48 per risultato visible
sub bl,48d
mov var3,bl


mov dl, var3					;stampo risultato
mov ah, 2h
int 21h




mov ah, 1h					;pause
int 21h

mov ax, 4c00h
int 21h
end start
