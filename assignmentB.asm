TITLE A program for summing the word array elements (assignment2)

INCLUDE Irvine32.INC 

.data   ;index 0 | 2  |  4  |  6       indexes used in type WORD
arrayD WORD 100h, 200h, 300h, 400h    ; array of four WORDS
msg BYTE "Summation is : ",0

.data?
summation WORD ?            ; label to store the sum of words

.code
main PROC

mov edx, OFFSET arrayD         ; edx = address of array
mov ecx, LENGTHOF arrayD         ; set engine of loop to size of array
mov ax, 0                     ; intially set accumalator to 0

myLoop:                       ; iterator/loop
      add ax, [edx]     ; accumulating values
      add edx, TYPE arrayD    ;[edx+0], [edx+2], [edx+4] and [edx+6]
      loop myLoop

mov summation, ax
mov edx, OFFSET msg           ; output as "Summation is: ___"
call WriteString
movzx eax, summation
call WriteHex                 ; display sum
 
exit
main ENDP 
END main