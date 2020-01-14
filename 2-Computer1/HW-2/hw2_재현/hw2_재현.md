## 코드 분석

- hello.asm 분석
    
    ```asm
    global    _start  ; C에서의 main과 비슷한 역할
    section   .text  ; text 세션 시작
    _start:  
        mov       rax, 1  ; 사용하는 시스템 호출이 write
        mov       rdi, 1  ; rdi : 값을 출력할 파일의 descriptor, 1 : 표준 출력
        mov       rsi, message ; message 문자열의 주소
        mov       rdx, 13  ; NULL을 제외한 문자열의 길이
        syscall  ; 우리가 원하는 write 시스템 호출을 실행할 수 있다!
        mov       rax, 60
        xor       rdi, rdi
        syscall  ; 프로세스 정상 종료를 위한 exit 시스템 호출 부분

    section   .data  ; 문자열은 data 영역에 저장되므로 data 영역을 선언, 문자열을 지정해준다
    message:
        db        "Hello, World", 10 ; 10은 개행문자의 아스키 코드
    ```

- strlen.asm 분석

    ```asm
    BITS 64  ; 64비트 사용

    section .text
    global _start

    strlen:  ; strlen 선언
        mov rax,0                  
    .looplabel:
        cmp byte [rdi],0  ; 레지스터와 값 비교   
        je  .end  ; 비교 후, 같으면 end로 분기    
        inc rdi  ; rdi 값을 1 증가           
        inc rax  ; rax 값을 1 증가
        jmp .looplabel  ; looplabel로 다시 돌아간다, 재귀함수
    .end:
        ret  ; 호출했던 바로 다음 지점으로 이동           
        
    _start:
        mov   rdi, msg              
        call  strlen  ; strlen 프로시져를 호출한다
        add   al, '0'  ; al 
        mov  [len],al  ; 
        mov   rax, 1   ; 사용하는 시스템 호출이 write    
        mov   rdi, 1   ; rdi : 값을 출력할 파일의 descriptor, 1 : 표준 출력
        mov   rsi, len  ;
        mov   rdx, 2        
        syscall           
        mov   rax, 60    
        mov   rdi, 0    
        syscall        

    section .data
        msg db "hello",0xA,0        
        len db 0,0xA         
    ```
