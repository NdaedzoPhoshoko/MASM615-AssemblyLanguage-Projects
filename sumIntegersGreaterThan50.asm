TITLE   program for summing integers greater than 50   (sumIntegersGreaterThan50.asm)

INCLUDE irvine32.inc

.data
array BYTE 10d,60d,20d,33d,72d,89d,45d,65d,72d,18d      ;storing integer array elements
sample BYTE 50d                                         ;sample to compare with
arraySize = ($-array)-1
sum DWORD ?

.code
main PROC

mov edx, 0                                               ;set index register to 0
top: cmp dl, arraySize                                   ;condition for loop
    jae next                                             ;jump out if index >= arraySize
    mov al, [array+edx]                                  ;accessing array element at index position
    cmp al, sample                                       ;if statement
    jna L1                                               ;if element <= sample, skip summing the element and continue with loop
    movzx eax, al
    add sum, eax                                          ;assuming element > sample then sum it
    L1: add dl, TYPE array                               ;index register edx=0,1,2,3....
        jmp top
next:

exit
main ENDP
END main 