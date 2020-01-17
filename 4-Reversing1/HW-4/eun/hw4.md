
# crackme0x04

1. main
pwndbg> disas main                                                            │
Dump of assembler code for function main:                                     │
   0x08048509 <+0>:     push   ebp                                            │
   0x0804850a <+1>:     mov    ebp,esp                                        │
   0x0804850c <+3>:     sub    esp,0x88                                       │
   0x08048512 <+9>:     and    esp,0xfffffff0                                 │
   0x08048515 <+12>:    mov    eax,0x0                                        │
   0x0804851a <+17>:    add    eax,0xf                                        │
   0x0804851d <+20>:    add    eax,0xf                                        │
   0x08048520 <+23>:    shr    eax,0x4                                        │
   0x08048523 <+26>:    shl    eax,0x4                                        │
   0x08048526 <+29>:    sub    esp,eax                                        │
   0x08048528 <+31>:    mov    DWORD PTR [esp],0x804865e                      │
   0x0804852f <+38>:    call   0x8048394 <printf@plt>                         │
   0x08048534 <+43>:    mov    DWORD PTR [esp],0x8048677                      │
   0x0804853b <+50>:    call   0x8048394 <printf@plt>                         │
   0x08048540 <+55>:    lea    eax,[ebp-0x78]                                 │
   0x08048543 <+58>:    mov    DWORD PTR [esp+0x4],eax                        │
   0x08048547 <+62>:    mov    DWORD PTR [esp],0x8048682                      │
   0x0804854e <+69>:    call   0x8048374 <scanf@plt>                          │
   0x08048553 <+74>:    lea    eax,[ebp-0x78]                                 │
   0x08048556 <+77>:    mov    DWORD PTR [esp],eax                            │
   0x08048559 <+80>:    call   0x8048484 <check>                              │
   0x0804855e <+85>:    mov    eax,0x0                                        │
   0x08048563 <+90>:    leave                                                 │
   0x08048564 <+91>:    ret             


2. check
 0x08048484 <+0>:     push   ebp                         ebp 넣음                
   0x08048485 <+1>:     mov    ebp,esp                   esp값(입력값?)을 ebp에 넣음                         │
   0x08048487 <+3>:     sub    esp,0x28                  esp에서 0x28을 빼줌                                │ 
   0x0804848a <+6>:     mov    DWORD PTR [ebp-0x8],0x0    ; 0으로 세팅해주는 거 같기도 하고                 │
   0x08048491 <+13>:    mov    DWORD PTR [ebp-0xc],0x0    ; 뭐해주는건지 모르겠음                   │
   0x08048498 <+20>:    mov    eax,DWORD PTR [ebp+0x8]       eax로 옮김                             │
   0x0804849b <+23>:    mov    DWORD PTR [esp],eax           esp로 옮김                     │
   0x0804849e <+26>:    call   0x8048384 <strlen@plt>                               │
   0x080484a3 <+31>:    cmp    DWORD PTR [ebp-0xc],eax       ebp-0xc 값이랑 eax랑 비교해줌                       │
   0x080484a6 <+34>:    jae    0x80484fb <check+119>         맞으면 바로 끝냄                 │
   0x080484a8 <+36>:    mov    eax,DWORD PTR [ebp-0xc]                                │ 
   0x080484ab <+39>:    add    eax,DWORD PTR [ebp+0x8]                                   │
   0x080484ae <+42>:    movzx  eax,BYTE PTR [eax]                                     │
   0x080484b1 <+45>:    mov    BYTE PTR [ebp-0xd],al                                 │  
   0x080484b4 <+48>:    lea    eax,[ebp-0x4]                                          │ 
   0x080484b7 <+51>:    mov    DWORD PTR [esp+0x8],eax                                    │
   0x080484bb <+55>:    mov    DWORD PTR [esp+0x4],0x8048638                              │
   0x080484c3 <+63>:    lea    eax,[ebp-0xd]                                       │ 
   0x080484c6 <+66>:    mov    DWORD PTR [esp],eax                                │     
   0x080484c9 <+69>:    call   0x80483a4 <sscanf@plt>                                     │
   0x080484ce <+74>:    mov    edx,DWORD PTR [ebp-0x4]                                    │
   0x080484d1 <+77>:    lea    eax,[ebp-0x8]                                          │
   0x080484d4 <+80>:    add    DWORD PTR [eax],edx                                        │
   0x080484d6 <+82>:    cmp    DWORD PTR [ebp-0x8],0xf                                │
   0x080484da <+86>:    jne    0x80484f4 <check+112>           만약에 다르면 112로 감                            │
   0x080484dc <+88>:    mov    DWORD PTR [esp],0x804863b                          │
   0x080484e3 <+95>:    call   0x8048394 <printf@plt>                             │
   0x080484e8 <+100>:   mov    DWORD PTR [esp],0x0                                 │
   0x080484ef <+107>:   call   0x80483b4 <exit@plt>                           │
   0x080484f4 <+112>:   lea    eax,[ebp-0xc]                                  │
   0x080484f7 <+115>:   inc    DWORD PTR [eax]                                │
   0x080484f9 <+117>:   jmp    0x8048498 <check+20>          다시 처음으로 가서 다시 돌림                 │
   0x080484fb <+119>:   mov    DWORD PTR [esp],0x8048649                      │
   0x08048502 <+126>:   call   0x8048394 <printf@plt>                         │
   0x08048507 <+131>:   leave                                                 │
   0x08048508 <+132>:   ret                                    
   

##  crackme0x05
1. main
pwndbg> disas main
Dump of assembler code for function main:
   0x08048540 <+0>:     push   ebp
   0x08048541 <+1>:     mov    ebp,esp
   0x08048543 <+3>:     sub    esp,0x88
   0x08048549 <+9>:     and    esp,0xfffffff0
   0x0804854c <+12>:    mov    eax,0x0
   0x08048551 <+17>:    add    eax,0xf
   0x08048554 <+20>:    add    eax,0xf
   0x08048557 <+23>:    shr    eax,0x4
   0x0804855a <+26>:    shl    eax,0x4
   0x0804855d <+29>:    sub    esp,eax
   0x0804855f <+31>:    mov    DWORD PTR [esp],0x804868e
   0x08048566 <+38>:    call   0x8048394 <printf@plt>
   0x0804856b <+43>:    mov    DWORD PTR [esp],0x80486a7
   0x08048572 <+50>:    call   0x8048394 <printf@plt>
   0x08048577 <+55>:    lea    eax,[ebp-0x78]
   0x0804857a <+58>:    mov    DWORD PTR [esp+0x4],eax
   0x0804857e <+62>:    mov    DWORD PTR [esp],0x80486b2
   0x08048585 <+69>:    call   0x8048374 <scanf@plt>
   0x0804858a <+74>:    lea    eax,[ebp-0x78]
   0x0804858d <+77>:    mov    DWORD PTR [esp],eax
   0x08048590 <+80>:    call   0x80484c8 <check>
   0x08048595 <+85>:    mov    eax,0x0
   0x0804859a <+90>:    leave
   0x0804859b <+91>:    ret

2. check
pwndbg> disas check
Dump of assembler code for function check:
   0x080484c8 <+0>:     push   ebp
   0x080484c9 <+1>:     mov    ebp,esp
   0x080484cb <+3>:     sub    esp,0x28
   0x080484ce <+6>:     mov    DWORD PTR [ebp-0x8],0x0
   0x080484d5 <+13>:    mov    DWORD PTR [ebp-0xc],0x0
   0x080484dc <+20>:    mov    eax,DWORD PTR [ebp+0x8]
   0x080484df <+23>:    mov    DWORD PTR [esp],eax
   0x080484e2 <+26>:    call   0x8048384 <strlen@plt>
   0x080484e7 <+31>:    cmp    DWORD PTR [ebp-0xc],eax
   0x080484ea <+34>:    jae    0x8048532 <check+106>
   0x080484ec <+36>:    mov    eax,DWORD PTR [ebp-0xc]
   0x080484ef <+39>:    add    eax,DWORD PTR [ebp+0x8]
   0x080484f2 <+42>:    movzx  eax,BYTE PTR [eax]
   0x080484f5 <+45>:    mov    BYTE PTR [ebp-0xd],al
   0x080484f8 <+48>:    lea    eax,[ebp-0x4]
   0x080484fb <+51>:    mov    DWORD PTR [esp+0x8],eax
   0x080484ff <+55>:    mov    DWORD PTR [esp+0x4],0x8048668
   0x08048507 <+63>:    lea    eax,[ebp-0xd]
   0x0804850a <+66>:    mov    DWORD PTR [esp],eax
   0x0804850d <+69>:    call   0x80483a4 <sscanf@plt>
   0x08048512 <+74>:    mov    edx,DWORD PTR [ebp-0x4]
   0x08048515 <+77>:    lea    eax,[ebp-0x8]
   0x08048518 <+80>:    add    DWORD PTR [eax],edx
   0x0804851a <+82>:    cmp    DWORD PTR [ebp-0x8],0x10
   0x0804851e <+86>:    jne    0x804852b <check+99>
   0x08048520 <+88>:    mov    eax,DWORD PTR [ebp+0x8]
   0x08048523 <+91>:    mov    DWORD PTR [esp],eax
   0x08048526 <+94>:    call   0x8048484 <parell>
   0x0804852b <+99>:    lea    eax,[ebp-0xc]
   0x0804852e <+102>:   inc    DWORD PTR [eax]
   0x08048530 <+104>:   jmp    0x80484dc <check+20>
   0x08048532 <+106>:   mov    DWORD PTR [esp],0x8048679
   0x08048539 <+113>:   call   0x8048394 <printf@plt>
   0x0804853e <+118>:   leave
   0x0804853f <+119>:   ret

3. parell
pwndbg> disas parell
Dump of assembler code for function parell:
   0x08048484 <+0>:     push   ebp
   0x08048485 <+1>:     mov    ebp,esp
   0x08048487 <+3>:     sub    esp,0x18
   0x0804848a <+6>:     lea    eax,[ebp-0x4]
   0x0804848d <+9>:     mov    DWORD PTR [esp+0x8],eax
   0x08048491 <+13>:    mov    DWORD PTR [esp+0x4],0x8048668
   0x08048499 <+21>:    mov    eax,DWORD PTR [ebp+0x8]
   0x0804849c <+24>:    mov    DWORD PTR [esp],eax
   0x0804849f <+27>:    call   0x80483a4 <sscanf@plt>
   0x080484a4 <+32>:    mov    eax,DWORD PTR [ebp-0x4]
   0x080484a7 <+35>:    and    eax,0x1
   0x080484aa <+38>:    test   eax,eax
   0x080484ac <+40>:    jne    0x80484c6 <parell+66>
   0x080484ae <+42>:    mov    DWORD PTR [esp],0x804866b
   0x080484b5 <+49>:    call   0x8048394 <printf@plt>
   0x080484ba <+54>:    mov    DWORD PTR [esp],0x0
   0x080484c1 <+61>:    call   0x80483b4 <exit@plt>
   0x080484c6 <+66>:    leave
   0x080484c7 <+67>:    ret
