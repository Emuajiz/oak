extern scanf, printf, fflush

section	.data
    fmt3 db '%d %d %d', 0
    fmt1 db '%d', 0
    
section .bss
    a   resd 4
    b   resd 4
    c   resd 4
   
segment .text
    global main
    
main:
    push c
    push b
    push a
    push fmt3
    call scanf
    add esp, 16

	mov eax, [c]
	mov edx, [b]
	mul edx
	mov edx, [a]
	mul edx
	push eax
	push fmt1
	call printf
	add esp, 16
	
flush:
    push 0
    call fflush
    add esp, 4

exit:
	mov	eax, 1	    ;system call number (sys_exit)
	mov ebx, 0
	int	0x80        ;call kernel
