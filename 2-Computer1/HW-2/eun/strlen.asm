BITS 64

section .text
global _start

strlen:             ;함수 만듬
    mov rax,0       ; rax = 0 출력할 변수 길이
.looplabel:         ; 루프 돌림
    cmp byte [rdi],0  ; rdi의 주소값이 널인지 확인
    je  .end          ; 널이면 탈출시킴
    inc rdi          ; rdi 1을 증가 시키고 결과를 다시 저장시킴           
    inc rax          ; rax(출력할 변수 길이)를 1 증가시킴
    jmp .looplabel   ; 루프 위로 다시 올라감   
.end:
    ret              ; 함수 종료  
    
_start:
    mov   rdi, msg       ; msg를 rdi에 저장
    call  strlen         ; strlen 함수 호출
    add   al, '0'       ; al에 널값을 더해줌               
    mov  [len],al            ;al 값을 len에 넣어줌
    mov   rax, 1            ;사용하는 시스템 호출이 write라는 것을 뜻함
    mov   rdi, 1           ;값을 출력할 파일의 descriptor, 1은 표준 출력
    mov   rsi, len          ; 근원지(source) 인덱스 레지스터
    mov   rdx, 2            ; 출력할 문자열 칸 (널 포함)
    syscall           
    mov   rax, 60       ; 끝내기 위한 시스템 호출
    mov   rdi, 0        ;return success
    syscall             ;운영체제를 호출 후 종료

section .data
    msg db "hello",0xA,0        
    len db 0,0xA         