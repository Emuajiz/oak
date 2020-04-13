extern scanf, printf, fflush

section	.data
    fmt3 db '%d %d %d', 0
    fmt1 db '%d', 0
    kerasm db 'keras', 10, 0
    pasm db 'pas', 10, 0
    kempesm db 'kempes', 10, 0
    
section .bss
    a   resd 4
    b   resd 4
    c   resd 4
   
segment .text
    global main
    
main:
    push c
    push fmt1
    call scanf
    add esp, 8
    
    mov edx, [c]
    cmp edx, 35
    jg keras
    cmp edx, 29
    jge pas
    jmp kempes

keras:
    push kerasm
    call printf
    add esp, 4
    jmp flush
    
pas:
    push pasm
    call printf
    add esp, 4
    jmp flush
    
kempes:
    push kempesm
    call printf
    add esp, 4
	
flush:
    push 0
    call fflush
    add esp, 4

exit:
	mov	eax, 1	    ;system call number (sys_exit)
	mov ebx, 0
	int	0x80        ;call kernel
