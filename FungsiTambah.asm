extern printf, fflush, scanf   
  
section .data 
    fmtScan db "%d %d", 0
    fmtPrint db "%d",10,0
  
section .bss
    a resd 4
    b resd 4
 
section .text 
global main  
 
  
main:
            ; sum_double(10, 5) --> eax = 30
    push    b
    push    a
    push    fmtScan
    call    scanf
    add     esp, 12
            
    push    dword [b]
    push    dword [a]
    call    sum
    add     esp, 8
    
    jmp printa
    
sum:

    push    ebp                     ; save old ebp
    mov     ebp, esp                ; set new ebp

    mov     eax, [ebp+8]            ; eax = uts  --> uts
    add     eax, [ebp+12]           ; eax += uas--> uts + uas
    mov     esp, ebp                ; deallocate local vars
    
    pop     ebp                     ; restore old ebp
    ret

printa:      
    push    eax
    push    fmtPrint
    call    printf
    add     esp, 8
   
flush:
    push 0  
    call fflush
    add esp, 4
 
exit:  
    mov eax, 1  
    mov ebx, 0  
    int 0x80