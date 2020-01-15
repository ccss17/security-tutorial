global    _start   
section   .text    

_start: 
   mov       rax, 1
   mov       rdi, 1
   mov       rsi, msg2
   mov       rdx, 13
   syscall

   mov       rax, 1
   mov       rdi, 1
   mov       rsi, msg2
   mov       rdx, 12
   syscall

   mov       rbp, [rbp+16]
   push      dword[rbp]
   push      prompt_str
   mov       rsi, prompt_str
   syscall

   mov       rax, 60
   xor       rdi, rdi
   syscall
section   .data
  msg1 db       "Hello, World", 0Ah
  msg2 db        "My name is ", 10
  prompt_str db  '%s',10,00


  //


 21 mov       rdx, 13
 20 syscall
 19
 18 mov       rax, 1
 17 mov       rdi, 1
 16 mov       rsi, msg2
 15 mov       rdx, 12
 14 syscall
 13
 12 mov       rdx, [rsp+16]
 11 PUSH      rdx
 10 PUSH      dword[rdx]
  9 PUSH      prompt_str
  8 syscall
  7
  6 mov       rax, 60
  5 xor       rdi, rdi
  4 syscall
  3 section   .data
  2 msg1 db       "Hello, World", 0Ah
  1 msg2 db        "My name is ", 10
31  prompt_str db  '%s', 10, 0
