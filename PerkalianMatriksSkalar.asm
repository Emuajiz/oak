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
    mov ecx, 0

l1:

    pusha

    mov eax, ecx
    
    mov ebx, 4
    mul ebx
    mov ebx, [mat+eax]
    mov eax, ebx
    mov ebx, [a]
    mul ebx
    push eax
    
    cmp ecx, 3
    je kolom
    cmp ecx, 7
    je kolom
    cmp ecx, 11
    je kolom

baris:
	push fmtBaris  
    jmp back

kolom:
    push fmtPrint
    jmp back

back:
	call printf  
	add esp, 8

    popa
    inc ecx
    cmp ecx, 12
    jl l1
  
Flush:
	push 0  
	call fflush

exit:  
	mov eax, 1  
	mov ebx, 0  
	int 0x80 