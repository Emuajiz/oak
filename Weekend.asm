extern printf, fflush, scanf   
  
section .data 
    fmtScan db "%s", 0
    fmtPrint db "%s",10,0
    sun db "Sun"
    sat db "Sat"
    weekdey db "weekday", 0
    weekend db "weekend", 0
  
section .bss
    a resd 80
 
section .text 
global main  
 
  
main:
    push    a
    push    fmtScan
    call    scanf
    add     esp, 8
    
    mov esi, sun
    mov edi, a
    mov ecx, 4
    repe cmpsb
    jecxz .libur    

    mov esi, sat
    mov edi, a
    mov ecx, 4
    repe cmpsb
    jecxz .libur
    
    jmp .masuk
    
.masuk:
    push weekdey
    push fmtPrint
    call printf
    add esp, 8
    jmp flush

.libur:
    push weekend
    push fmtPrint
    call printf
    add esp, 8
    jmp flush


   
flush:
    push 0  
    call fflush
    add esp, 4
 
exit:  
    mov eax, 1  
    mov ebx, 0  
    int 0x80