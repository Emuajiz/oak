extern printf, fflush, scanf

section .data 
    fmtScanS db "%s", 0
    fmtScanC db "%c", 0
    fmtPrintS db "%s", 10,0
    fmtPrintC db "%c", 10, 0
    fmtPrintD db "%d", 10, 0
    fmtPrint db "tidak ada", 10, 0
  
section .bss
    panjang resb 51
    pendek resb 2
 
section .text 
global main  
 
  
main:
    push    panjang
    push    fmtScanS
    call    scanf
    add     esp, 8
    
    push    pendek
    push    fmtScanS
    call    scanf
    add     esp, 8
    
    mov esi, panjang
    mov edi, pendek
    mov ecx, 0
    
.ceksama
    cmp ecx, 50
    je .gaada
    
    cmpsb
    je .selesai
    
    dec edi
    inc ecx
    jmp .ceksama

.gaada
    push fmtPrint
    call printf
    add esp, 4
    jmp flush

.selesai
    inc ecx
    push ecx
    push fmtPrintD
    call printf
    add esp, 8

   
flush:
    push 0  
    call fflush
    add esp, 4
 
exit:  
    mov eax, 1  
    mov ebx, 0  
    int 0x80