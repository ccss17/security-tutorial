section   .text
global    _start

strlen:
    mov rax,0
.looplabel:
    cmp byte [rdi],0
    je  .end
    inc rdi
    inc rax
    jmp .looplabel
.end:
    ret

print:
    mov       rax, 1
    mov       rdi, 1
    syscall
    ret

exit:
    mov       rax, 60
    xor       rdi, rdi
    syscall

_start:
    mov       rsi, message
    mov       rdx, 24
    call print
    mov       rdi, [rsp+16]
    call strlen
    mov       rsi, [rsp+16]
    mov       rdx, rax
    call print
    mov       rsi, newline
    mov       rdx, 1
    call print
    call exit

section   .data
message: db        "Hello, World", 10, "My name is "
newline: db        10