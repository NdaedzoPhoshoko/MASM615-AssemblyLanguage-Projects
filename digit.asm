TITLE Add and Subtract, Version 2            (AddSub2.asm)
; This program adds and subtracts 32-bit unsigned
; integers and stores the sum in a variable.
INCLUDE Irvine32.inc
.data

.code

main PROC

mov al,7		; AL = 00000110b
or  al,00110000b	; AL = 00110110b

	
call writebin


; call DumpRegs	; display the registers

exit
main ENDP
END main
