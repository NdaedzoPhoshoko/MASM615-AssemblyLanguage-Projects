TITLE our first testing project  (structure.asm)

INCLUDE Irvine32.inc 
.data
num1 BYTE 1100b       ;nameOfVar databyte value
num2 BYTE 1b          ; num2 = 1

.code
main PROC

mov aL, num1          ; nameOfInstruct nameOfReg, valueThatFitsTheReg
add aL, num2          ; aL = 11d+2d = 13d =3D

call dumpRegs         ;display the registers, so simply: dumpRegs is a function

exit
main ENDP
END main

comment p 

32 bit EAX => 16 bit ax + ax => 8 bit aH + aL 
eax = 0000 0011h 32bit 
EAX = 16 BIT 0000 | ax 16bit |8 bit 00 | 8 bit 00h 
   = 0000 0000 0000 0000 0000 0000 0000 0000 b 
.......................




