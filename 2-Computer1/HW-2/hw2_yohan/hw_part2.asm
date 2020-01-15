
global    _start   
section   .text    

_start:
    mov       rax, 1     
    mov       rdi, 1      
    mov       rsi, msg1 
    mov       rdx, 13   
    syscall             
    mov       rax, 1      
    mov       rdi, 1      
    mov       rsi, msg2 
    mov       rdx, 16    
    syscall  


    mov       rax, 60     
    xor       rdi, rdi     
    syscall                
    section   .data                   
    msg1 db        "Hello, World", 0Ah   
    msg2 db        "My name is John", 10

   