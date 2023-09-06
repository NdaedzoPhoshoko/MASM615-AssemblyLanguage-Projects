

TITLE How to use the OFFSET dir        (offset.asm)

Include Irvine32.inc 

.data?

.data
varB BYTE 0Ch, 0Bh      ;declare a byte array of two hexadecimal values
.code

main PROC
mov esi, OFFSET varB    ; esi = address where first element in byte is stored( memory segment)
call DumpRegs

ret
main ENDP
END main