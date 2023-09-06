TITLE starting chapter 4       (project.asm)

INCLUDE Irvine32.inc

.data
intArray WORD 100h,200h,300h,400h
sumMsg BYTE "SUm of array is: ",0

.code
main PROC

mov eax, 0h                        ;set accumulator to zero
mov ebx, 0d                        ;set ebx=0 and bx register will store array indexes 0,2,4,6... for word array
mov ecx, LENGTHOF intArray         ;set engine of loop to according to length of array

myLoop:
    add ax, [intArray+bx]          ;sum current element found at index bx
    add bx, 2d                     ; change bx index to 0,2,4,....
    loop myLoop

mov edx, OFFSET sumMsg
call writeString                  ; display string "Sum of array is: "

call writeHex                     ; display computed sum as hexademical
exit
main ENDP
END main

COMMENT p 
we used array, loop and LENGTHOF
p