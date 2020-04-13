extern printf, fflush, scanf   
 
section .data 
    fmtScan db "%d", 0
    fmtBaris db "%d ", 0
    fmtPrint db "%d",10,0

    mat dd 7, 11, 10, 6   
        dd 5, 8, 9, 12
        dd 11, 13, 12, 15
    data db 0
 
 
section .bss 
    a resd 4

section .text 
global main  

 
main:
	push a
	push fmtScan  
	call scanf  
	add esp, 8
    
banding0:
    mov eax, [a]
    cmp eax, 0
    je flush
    
kuadrat:
    mov ebx, eax
    mul eax

print:
    push eax
    push fmtPrint
    call printf
    add esp, 8
    
    jmp main
  
flush:
	push 0  
	call fflush
	add esp, 4

exit:  
	mov eax, 1  
	mov ebx, 0  
	int 0x80 