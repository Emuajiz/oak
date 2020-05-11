extern printf, fflush, scanf

section .data 
    fmtScanS db "%s", 0
    fmtScanC db "%c", 0
    fmtPrintS db "%s", 10,0
    fmtPrintC db "%c", 10, 0
    fmtPrintD db "%d", 10, 0
    fmtPrint db "tidak ada", 10, 0
    kosongan db 0
    titik db "."
  
section .bss
    input resb 40
 
section .text 
global main  
 
  
main:

    push    input
    push    fmtPrintS
    call    scanf
    add     esp, 8
    
    mov esi, input
    mov edi, titik
    mov ecx, 0

.ceksama
    cmp ecx, 40
    je selesai.paksa
    
    cmpsb
    je ceklagi
    
    dec edi
    inc ecx
    jmp .ceksama


ceklagi:
    mov ecx, 0
    mov edi, kosongan
    
.looplagi
    cmp ecx, 40
    je selesai
    
    cmpsb
    je selesai
    
    dec edi
    inc ecx
    jmp .looplagi
    
selesai:
    push ecx
    jmp .normal
    .paksa
    mov ecx, 0
    push ecx
    .normal
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