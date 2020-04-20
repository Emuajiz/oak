extern printf, fflush, scanf   
  
section .data 
    fmtScan db "%d %d %d %d %d %d %d", 0
    fmtPrint db "%d",10,0
  
section .bss
    tugas resd 4
    kuis resd 4
    proj resd 4
    uasp resd 4
    utsp resd 4
    uas resd 4
    uts resd 4
 
section .text 
global main  
 
  
main:
            ; sum_double(10, 5) --> eax = 30
    push    tugas
    push    kuis
    push    proj
    push    uasp
    push    utsp
    push    uas
    push    uts
    push    fmtScan
    call    scanf
    add     esp, 32
            
    push    dword [tugas]
    push    dword [kuis]
    push    dword [proj]
    push    dword [uasp]
    push    dword [utsp]
    push    dword [uas]
    push    dword [uts]
    call    nilai_akhir
    add     esp, 28
    
    jmp printa
    
nilai_akhir:
;(uts*30 + uas*30 + utsp*10 + uasp*10 + proj*10 + kuis*5 + tugas*5) / 100
    push    ebp                     ; save old ebp
    mov     ebp, esp                ; set new ebp

    sub     esp, 4                  ; allocate 1 local vars
    mov     dword [ebp-4], 0        ; sum = 0

    mov     eax, [ebp+8]            ; eax = uts  --> uts
    add     eax, [ebp+12]           ; eax += uas--> uts + uas
    mov     ebx, 30
    mul     ebx                     ; eax *= 30  --> (uts + uas) * 30
    add     dword [ebp-4], eax      ; sum += eax
    
    mov     eax, [ebp+16]           ; eax = utsp --> utsp
    add     eax, [ebp+20]           ; eax += uasp --> utsp+uasp
    add     eax, [ebp+24]           ; eax += proj --> utsp+uasp+proj
    mov     ebx, 10
    mul     ebx
    add     dword [ebp-4], eax      ; sum += eax
    
    mov     eax, [ebp+28]           ; eax = kuis --> kuis
    add     eax, [ebp+32]           ; eax += tugas --> kuis+tugas
    mov     ebx, 5
    mul     ebx
    add     dword [ebp-4], eax      ; sum += eax
    
    mov     eax, dword [ebp-4]
    mov     ebx, 100
    div     ebx
    
    cmp     edx, 50
    jl     .lompat
    
    inc eax
    
.lompat:
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