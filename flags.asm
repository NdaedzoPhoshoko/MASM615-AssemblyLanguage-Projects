TITLE testing the flags (test.asm)

Include Irvine32.inc

.data
.code

main PROC

mov ax, 0FFFFh
inc ax
call WriteInt
call dumpRegs

ret
main ENDP
END main

COMMENT p
results after execution

recall that the mov instr does not affect the flags

ZERO flag = 1 When destination equals to zero
CARRY flag = 1 When result of two positive(unsigned) values is negative(signed)
SIGN flag = 1 When destination equals negative
OVERFLOW flag = 1 When signed value is out of rane(not fitting size)

p