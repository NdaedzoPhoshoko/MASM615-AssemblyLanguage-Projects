TITLE how to use the nested loop to print string   (loop.asm)

INCLUDE Irvine32.inc

; AIM:use nested loop tp print word person three times, each person shall have 4 letter x

.data?
tempVal DWORD ?

.data
str1 BYTE "x ",0
str2 BYTE "person ",0
newLine BYTE 10d,13d,0


.code
main PROC

mov ecx, 3
outerLoop:                      ;executions:   3-1   2-1   1-1
    mov edx, OFFSET str2
    call WriteString            ;print word "person"
    mov tempVal, ecx            ;save the remaining ecx value

    mov ecx, 4
    innerLoop:                      ;printing the letter "x " 4 times
        mov edx, OFFSET str1
        call WriteString            ;  printing the letter "x "
        loop innerLoop

    mov edx, OFFSET newLine
    call WriteString            ;newLine

mov ecx, tempVal                ;pass the remaining ecx value
loop outerLoop

ret
main ENDP
END main

COMMENT p 

results :

person x x x x
person x x x x
person x x x x

struct NESTED_LOOP
Syntax:
L1:             ;outer loop
dec ecx
if ecx != 0
tempVal <- ecx 

mov ecx, value
L2:
dec ecx
if ecx != 0
jump to L2

ecx <- tempVal
 jump to L1

p 