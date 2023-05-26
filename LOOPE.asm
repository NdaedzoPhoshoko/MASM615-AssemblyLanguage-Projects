TITLE LOOPE/LOOPZ used to traverse the array elements (study.asm)

INCLUDE Irvine32.inc

.data
array SWORD 0,0,0,-1,4,0

.code

main PROC
mov esi, OFFSET array
mov ecx, LENGTHOF array

mov esi, OFFSET array
mov ecx, LENGTHOF array

L1:   cmp WORD PTR [esi], 0   ;equal = 0
pushfd
add esi, 2
popfd
LOOPZ L1    ;use LOOPE   ;if ZF =0
jz quit     lif z != 0
sub esi, 2

quit:

call dumpRegs

ret
main ENDP
END main