global    _start
section   .text
_start:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, message1
    mov       rdx, 13
    syscall
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, message2
    mov       rdx, 18
    syscall
    mov       rax, 60
    xor       rdi, rdi
    syscall
    
    section   .data
message1:
  db   "Hello, World", 10
message2:
  db   "My name is Jaehyun", 10