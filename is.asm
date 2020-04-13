extern printf, fflush

section	.text
    global main
main:
    mov ecx, 10
    
loop1:
    mov edx, ecx
    pushad
    push edx
    push fmt1
    call printf
    add esp, 8
    
flushing:
    push 0
    call fflush
    add esp, 4
    popad

    loop loop1

section	.data
    fmt1 db "%d", 10, 0