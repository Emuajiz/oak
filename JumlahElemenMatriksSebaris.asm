extern printf, fflush, scanf
    
segment .data
    fmtscan db "%d", 0
    fmt0 db "34", 10, 0
    fmt1 db "24", 10, 0
    fmt2 db "20", 10, 0
segment .bss
    a   resd 4
   
segment .text
    global main
main:
    push a
    push fmtscan
    call scanf
    add esp, 8
    
    mov eax, [a]
  
    cmp eax, 0
    je nA
    cmp eax, 1
    je nB
    jmp nC
  
nA:
    push fmt0
    jmp prin
  
nB:
    push fmt1
    jmp prin
      
nC:
    push fmt2
    jmp prin
prin:
    call printf
    add esp, 4
 
flush:
    push 0
    call fflush
    add esp, 4
    
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80