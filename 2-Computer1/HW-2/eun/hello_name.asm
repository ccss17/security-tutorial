global    _start           ; c언어에서의 메인 함수 느낌
section   .text             
                            
_start:
    mov       rax, 1           ;사용하는 시스템 호출이 write라는 것을 뜻함
    mov       rdi, 1            ;값을 출력할 파일의 descriptor, 1은 표준 출력
    mov       rsi, message 
    mov       rdx, 23           ;문자열 넣을 칸
    syscall                             ; 표준출력, 즉 모니터에 문자열 출력
    mov       rax, 60
    xor       rdi, rdi          ;exclusive OR ,  둘다 서로 다르면 참, 같으면 거짓 
    syscall
    section   .data                     ; 여기에는 데이터를 넣는 곳
message:
    db        "Hello, World", 10        ; hello world를 메세지에 넣어줌.  10은 개행문자
    db        "eunsoo",10