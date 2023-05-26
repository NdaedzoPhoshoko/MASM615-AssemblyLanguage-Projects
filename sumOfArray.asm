TITLE how to sum finite array elements using indirect operands   (sumOfArray.asm)

INCLUDE Irvine32.inc 

.data
arrayDW DWORD 1000h,2000h,3000h            ;index  0   4   8   12......

.code
main PROC

mov esi, OFFSET arrayDW     ;store the address of the array into the indirect reg
mov eax, [esi]              ;store the first value pointed by the address in esi
add esi, 4                  ;increment the address to point arraDW+4
add eax, [esi]              ; eax = 1000h+2000h
add esi, 4                  ;increment the address to point 3000h  e.g ( 0404008h)
add eax, [esi]              ;store the last valuepointed by the address of arrayDW+8

call dumpRegs               ; call the registers including the eax reg accumulator

ret
main ENDP
END main

COMMENT p 

Strategy: store the address of an arrayDW into an indirect operand register
then use a counting register to add values of the arrayDW
When you add the second value, increment the indirect register to point to the following value 
Increment the address with the TYPE size of an arrayDW

p