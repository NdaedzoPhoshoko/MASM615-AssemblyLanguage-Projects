TITLE    testing (array.asm)

INCLUDE IRVINE32.INC 
.data
intArray DWORD 10,60,20,33,72,84,45,65,72,18
sample DWORD 50
arraySize = ($-intArray)/4
sum DWORD 0
.code
main proc

mov edx, 0
mov cl, 0
top: cmp cl, arraySize
ja outside
call dumpregs
mov eax, [intArray+edx]
cmp eax, sample
jna skip
add sum, eax
skip: add dx, TYPE intArray
inc cl
jmp top
outside:

mov eax, sum
call writeInt
exit
main ENDP 
END main