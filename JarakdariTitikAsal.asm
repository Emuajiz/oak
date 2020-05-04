extern printf, fflush, scanf   
 
section .data 
    fmtScan db "%lf %lf", 0
    fmtPrint db "%f", 10, 0
    bagi db 2,
 
section .bss 
    a resq 1
    b resq 1
    c resq 1

section .text 
global main  

 
main:
	push b
	push a
	push fmtScan  
	call scanf  
	add esp, 12
	
	finit                   ; st0
	fld    qword [a]
	fmul    qword [a]
	fld    qword [b]
	fmul    qword [b]
	faddp
	fsqrt
	fst     qword [c]
	
    push dword [c+4]
    push dword [c]
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