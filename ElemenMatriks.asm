extern printf, fflush, scanf   
 
section .data 
fmtScan db "%d %d", 0
fmtPrint db "%d",10,0

mat     dd 7,11,10,6   
        dd 5,8,9,2 
        dd 1,3,12,4
 
 
section .bss 
a resd 4   
b resd 4

section .text 
global main  

 
main:
	push b  
	push a
	push fmtScan  
	call scanf  
	add esp, 12   
 
	mov eax, [a] 
	mov ebx, 16 
	mul ebx	
	mov ecx,eax
 
	mov eax, 4
	mov ebx, [b]
	mul ebx


	add ecx,eax 
	mov ebx, [mat+ecx]
	push ebx 
	push fmtPrint  
	call printf  
	add esp, 8     

  
Flush:
	push 0  
	call fflush

exit:  
	mov eax, 1  
	mov ebx, 0  
	int 0x80 