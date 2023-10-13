TITLE summing values greator than 50 (question2.asm)

INCLUDE IRVINE32.INC
.data
array    BYTE 10, 60, 20, 33, 72, 89, 45, 65, 72, 18
Sample   BYTE 50
Sum      WORD 0
ArraySize BYTE ?
msgShow BYTE "Sum is: ",0
.code

Main PROC

mov arraySize, lengthof array
mov edx, 0                                               ;set index register to 0
top: cmp dl, arraySize                                   ;condition for loop
    jae next                                             ;jump out if index >= arraySize
    mov al, [array+edx]                                  ;accessing array element at index position
    cmp al, sample                                       ;if statement
    jna L1                                               ;if element <= sample, skip summing the element and continue with loop
    movzx ax, al
    add sum, ax                                          ;assuming element > sample then sum it
    L1: add dl, TYPE array                               ;index register edx=0,1,2,3....
        jmp top
next:

mov edx, offset msgShow
call writeString
movzx eax, Sum
call writeInt

exit
Main ENDP
END Main
