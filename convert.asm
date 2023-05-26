TITLE Add and Subtract, Version 2            (AddSub2.asm)
; This program adds and subtracts 32-bit unsigned
; integers and stores the sum in a variable.
INCLUDE Irvine32.inc
.data

.code

main PROC

mov al ,'z'		; AL = 01100001b
and al,11011111b	; AL = 01000001b
	
call writechar

; call DumpRegs	; display the registers

exit
main ENDP
END main
