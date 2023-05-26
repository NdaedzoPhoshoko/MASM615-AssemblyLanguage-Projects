TITLE REGISTER PROGRAM            ( reg.asm)

INCLUDE Irvine32.inc

.data?
bval BYTE ?
bval2 BYTE 3 DUP(?)


.code
main PROC

mov ax, -12 + 12     ;hy
call DumpRegs

COMMENT p
This are paragraph comments
hey there
hy how are you
p

ret
main ENDP
END main
