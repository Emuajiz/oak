extern printf, fflush, scanf   
 
section .data 
    fmtScan db "%f", 0
    fmtPrint db "%f", 10, 0
    bagi db 2,
 
section .bss 
    r resd 1
    area resq 1

section .text 
global main  

 
main:
	push r
	push fmtScan  
	call scanf  
	add esp, 8
	
	finit                   ; st0
	fldpi                   ; pi
	fadd    st0
	fmul    dword [r]
	fidiv   dword [bagi]
	fst     qword [area]
	
    push dword [area+4]
    push dword [area]
    push fmtPrint
    call printf
    add esp, 12
  
flush:
	push 0  
	call fflush
	add esp, 4

exit:  
	mov eax, 1  
	mov ebx, 0  
	int 0x80 