# HW2
 
## 1. 어셈블리어로 된 프로그램을 분석해보세요

### **hello.asm**
```c
global    _start //main을 선언한다. 
section   .text //text section을 선언한다. 
_start: //_startProcedure를 선언한다. 
    mov       rax, 1 //rax레지스터에 1을 저장한다. 사용하는 시스템 호출이 write이다. 
    mov       rdi, 1 //rdi레지스터에 1을 저장한다. 표준 출력
    mov       rsi, message //rsi는 message문자열의 주소. 
    mov       rdx, 13 //rdx에 13을 저장한다. NULL바이트를 제외한 문자열의 길이. 
    syscall   //프로세스가 종료하도록 exit시스템 호출하기
    mov       rax, 60 //rax레지스터에 60을 저장한다. 
    xor       rdi, rdi //값이 다르면 참1, 같으면 거짓0이다. 
    syscall 
    section   .data  //data section영역임을 선언한다.
message: //message는 "Hello World!"를 담고 있는 변수이름이다. 
    db        "Hello, World", 10  //10은 개행문자 '\n'의 아스키코드 값이다. 
```

### **strlen.asm**
```c
BITS 64 //64비트사용

section .text //text section 선언한다. 
global _start //main 선언한다. 

strlen:  //strlen 함수 
    mov rax,0  //rax레지스터에 0을 저장한다.           
.looplabel:
    cmp byte [rdi],0  //한 바이트 씩 0과 같은지 비교..         
    je  .end  //je는 jump equal이다. 위의 비교값이 같으면 빠져나간다.            
    inc rdi  //rdi 를 1증가시키고 결과값을 저장한다.               
    inc rax  //rax 를 1증가시키고 결과값을 저장한다. 
    jmp .looplabel    //다시 looplabel로 간다.         
.end:
    ret //return   
    
_start:   //startProcedure를 선언한다. 
    mov   rdi, msg    //rdi = msg의 주소. 
    call  strlen //strlen 함수 호출한다. 
    add   al, '0'  //al에 0을 더해준다. 리턴한 값이 al에 저장.             
    mov  [len],al            
    mov   rax, 1  //사용하는 시스템 호출이 write라는 말.         
    mov   rdi, 1  //표준출력.      
    mov   rsi, len  //rsi에 len을 저장한다. //rsi는 len문자열의 주소.     
    mov   rdx, 2  //rdx에 2를 저장한다. NULL바이트를 제외한 문자열의 길이.      
    syscall   //프로세스가 종료하도록 exit시스템 호출하기        
    mov   rax, 60  //rax레지스터에 60을 저장한다.   
    mov   rdi, 0  //rdi에 0을 저장한다.   
    syscall        

section .data
    msg db "hello",0xA,0        
    len db 0,0xA  //0xA는 NULL.
```

## 2. hello.asm 을 업그레이드 하세요.

### **hello_sujin.asm**

```c
global    _start
  section   .text
  
  _start:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, message
    mov       rdx, 13
    syscall
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, message2 
    mov       rdx, 17
    syscall
    mov       rax, 60
    xor       rdi, rdi
    syscall
    section   .data
message db        "Hello, World", 10
message2 db        "My name is Sujin", 10
```


## 3. hello.asm 업그레이드(2) 


## 4. 아무거나 쓰세요
 - 고오오오스트 GBC 아무말아무말
 - 삼촌네 찜닭 족막 몽불  묵은지 김치 치즈 찜닭!!!
