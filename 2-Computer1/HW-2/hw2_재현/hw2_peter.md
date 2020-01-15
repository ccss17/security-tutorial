### 코드 분석


\- hello.asm 분석

- rax, rdi, rsi, rdx 값이 있어야 출력할 수 있다

  

```asm
global    _start  ; C에서의 main과 비슷한 역할
section   .text  ; text 세션 시작
_start:
    mov       rax, 1  ; 사용하는 시스템 호출이 write
    mov       rdi, 1  ; rdi : 값을 출력할 파일의 
    mov       rsi, message  ; message 문자열의 주소
    mov       rdx, 13  ; 13은 NULL을 제외한 문자열의 길이
    syscall  ; 우리가 원하는 write 시스템 호출을 실행할 수 있다!
    mov       rax, 60
    xor       rdi, rdi
    syscall  ; 프로세스 정상 종료를 위한 exit 시스템 호출 부분
    
section   .data  ; 문자열은 data 영역에 저장되므로 data 영역을 선언, 문자열을 지정해준다
    message:
    db        "Hello, World", 10  ; db는 1바이트만큼의 메모리 지정, 10은 개행문자의 아스키 코드

```

 

\- strlen.asm 분석



```asm
BITS 64

section .text
global _start

strlen:  ; strlen 선언
    mov rax,0                  
.looplabel:
    cmp byte [rdi],0  ; [rdi]와 값(0) 비교, 처음엔 h가 들어가고 하나씩 증가
    je  .end  ; 비교 후, 같으면 end로 분기        
    inc rdi  ; rdi 값을 1 증가     
    inc rax                    
    jmp .looplabel  ; looplabel로 다시 돌아간다, 재귀함수
.end:
    ret  ; 호출했던 바로 다음 지점으로 이동
    
_start:
    mov   rdi, msg  ; msg를 rdi 값으로 넣어준다   
    call  strlen  ; strlen 함수를 불러온다
    add   al, '0'  ; al(rax 값) 뒤에 '0' 더함
    mov  [len],al
    mov   rax, 1           
    mov   rdi, 1  
    mov   rsi, len  ; len의 주소을 출력
    mov   rdx, 2  ; rdx의 문자열 길이 : 2
    syscall  ; write 호출
    mov   rax, 60    
    mov   rdi, 0  
    syscall  ; exit 시스템 호출

section .data
    msg db "hello",0xA,0  ; msg 문자열 : 'hello'
    len db 0,0xA  ; 길이 : 0
```



### 코드 만들기



- hello_name.asm 만들기



```asm
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
```



- message를 하나 더 만들어서 출력했다
