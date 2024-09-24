TITLE Voting Program (vote.asm)
INCLUDE IRVINE32.inc 

.data                                  ;initialized labels
nameMsg BYTE "Enter your name: ",0
ageMsg BYTE "Enter your age: ",0
userName BYTE 20 DUP(0),0
votingMsg BYTE ", you are eligible to vote.",0
notVotingMsg BYTE ", you are not eligible to vote.",0
age DWORD ?
.code                                  ;procedures

isAllowed PROC                      ;display that the user is allowed to vote
mov edx, OFFSET votingMsg
call writeString
ret
isAllowed ENDP

isNotAllowed PROC                      ;display that the user is not allowed to vot
mov edx, OFFSET notVotingMsg
call writeString
ret
isNotAllowed ENDP

main PROC
call ClrScr
mov edx, OFFSET nameMsg            ; collect name and age
call writeString
mov edx, OFFSET userName
mov ecx, SIZEOF userName
call readString

call Crlf
mov edx, OFFSET ageMsg
call writeString
call readInt
mov age, eax
call Crlf

mov edx, OFFSET userName
call writeString
cmp age, 18                       ;jump to isAllowed if age>=18
jge isAllowed
cmp age, 18                       ;jump to isNotAllowed if age<18
jL isNotAllowed

exit
main ENDP
END main