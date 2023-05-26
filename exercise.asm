TITLE SHLD instr         (exercise.asm)
;Names : Phoshoko N
;Student no: 202018636
;Date : 15-October-2021
;Program : Using the SHLD instr on registers
 
INCLUDE Irvine32.inc

.data
wval WORD 9BA6h

.code
main PROC                        ;creating a procedure main

mov ax, 0AC36h                  ;assign ebx = AC36
shld wval, ax, 2                ;shifting destination operand with the 2 left most bits from the source ebx, pushes the wval bits to the left
mov bx, wval                    ; storing the wval into eax reg
call DumpRegs                    ;calling the dump registers to show the results of eax reg

exit
main ENDP                        ;exiting the main procedure
END main