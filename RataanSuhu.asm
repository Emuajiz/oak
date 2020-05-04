extern printf, fflush, scanf   
 
section .data 
    fmtScanN db "%d", 0
    fmtScan db "%f", 0
    fmtPrintN db "%d", 10, 0
    fmtPrint db "%.1f", 10, 0
    satu db 1,
 
section .bss
    n resd 1
    a resd 1
    total resq 1

section .text 
global main  

 
main:
	push n
	push fmtScanN
	call scanf
	add esp, 8
	
    mov ecx, 0
    finit
    fld1
    fisub dword [satu]
    
pr:
    push ecx
    
	push a
	push fmtScan
	call scanf
	add esp, 8
	fadd dword [a]
    
    pop ecx
    inc ecx
    cmp ecx, dword [n]
    jl pr
    
    push    dword [n]
    fidiv    dword [esp] 
    fst     qword [total]
    add     esp, 4
    
    push dword [total+4]
    push dword [total]
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