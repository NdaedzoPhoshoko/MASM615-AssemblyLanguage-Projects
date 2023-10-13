;Name: LINDER KHUMALO
;Student number: 202110065
;Submission date: 09 October 2023

TITLE Reversing String  (ReverseString.asm)
INCLUDE Irvine32.inc 

.data
aString BYTE "Assembly Language",0
StringSize = ($ - aString) - 1
msgSHow BYTE "String in reverse is: ",0

.code
main PROC
mov ecx, LENGTHOF StringSize      ; set loop counter to length of string aString 
mov edx, 0                        ; set edx=0

Loop1:
  mov al, [aString+edx]            
  movzx ax, al                   
  push ax                         ; saving character read to stack
  inc edx                         ; incrementing index 0,1,2,3,...,lengthof-1
  loop Loop1                      ; repeat until all charaters are pushed
    
mov ecx, LENGTHOF StringSize      ; set loop counter to length of string aString
mov edx, 0                        ; set edx=0

Loop2:
 pop ax                           ; saving character read from stack
 mov [aString+edx], al
 inc edx                          ; incrementing index 0,1,2,3,...,lengthof-1
 loop Loop2                       ; repeat until all charaters are popped

mov edx, offset msgSHow
call writeString
mov edx, OFFSET aString
call writeString                  ;displaying string in reverse
exit
main ENDP
END main