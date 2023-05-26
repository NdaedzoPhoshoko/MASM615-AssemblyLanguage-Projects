TITLE How to use the LENGTHOF dir           (AddSub.asm)

; LENGTHOF is number of element in a signle label declaration

INCLUDE Irvine32.inc
.data
myByte QWORD 3, 100000
.code
main PROC
	
    mov ecx, LENGTHOF myByte
	call DumpRegs		; display registers
	exit
main ENDP
END main
