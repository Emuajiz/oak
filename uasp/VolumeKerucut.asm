extern printf, fflush, scanf   
 
section .data 
    fmtScan db "%lf %lf", 0
    fmtPrint db "%.4f", 10, 0
    bagi db 3,
 
section .bss 
    r resq 1
    t resq 1
    area resq 1

section .text 
global main  

 
main:
	push t
	push r
	push fmtScan  
	call scanf  
	add esp, 12
	
	finit
	fldpi
	fmul    qword [r]
	fmul    qword [r]
	fmul    qword [t]
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