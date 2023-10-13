TITLE the program that reversing String (project2.asm)

include irvine32.inc

.data
aName BYTE "Assembly Language",0
namesize = ($ - aName) - 1
msgStr BYTE "showing string in reverse : ",0

.code
main PROC
; Push the name on the stack.
    mov ecx,nameSize
    mov esi,0

L1: movzx eax, aName[esi]                   ; get character
    push eax                                ;push on stack
    inc esi
    loop L1

; Pop the name from the stack, in reverse,
; and store in the Name array.

    mov ecx,namesize
    mov esi, 0

L2: pop eax                                 ;Get Character
    mov aName[esi],al                       ;Store in string
    inc esi

    loop L2

mov edx, offset msgStr
call writeString
mov edx, offset aName
call writeString

exit
main ENDP
END main