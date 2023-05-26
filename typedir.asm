TITLE How to use a TYPE dir for size of labels in bytes       (AddSub.asm)

INCLUDE Irvine32.inc

.data
varW BYTE 100 DUP(?)
.code

main PROC
	
    mov eax, TYPE varW   ;throw the size in bytes of varW(1byte = 8 bits)
    call DumpRegs		; display registers
	exit
main ENDP
END main

