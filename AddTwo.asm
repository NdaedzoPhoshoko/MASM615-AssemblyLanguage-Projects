; AddTwo.asm - adds two 32-bit integers

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.code
main PROC

   mov eax,5        ;move 5 to the EAX register
   mov eax,6        ;move 6 to the EAX register

   INVOKE ExitProcess,0
main ENDP
END main   