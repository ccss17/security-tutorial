### hw_part2 코드 분석
```
global    _start    ; _start라는 이름의 Procedure / C의 main함수 역할
section   .text     ; 텍스트 섹션 선언 (코드를 작성하기 위해 ) 

_start:
    mov       rax, 1       ; rax = 1은 사용하는 시스템 호출이 write라는 것을 뜻함 / rax 레지스터에 1을 저장 ( cf - C언어 : int n = 100) 
    mov       rdi, 1       ; rdi(값을 출력할 파일의 descriptor) = 1 이라는 것은 표준 출력을 의미  / rdi 레지스터에 1을 저장 
    mov       rsi, msg1    ; rsi 레지스터에 메세지("Hello World" 담고있는 변수) 저장
    mov       rdx, 13      ; 문자열의 길이 저장
    syscall                ; 위의 4가지 설정 완료 후 write 시스템 호출
    mov       rax, 1       ; rax 레지스터에 1을 저장 ( cf - C언어 : int n = 100) / rax = 1은 사용하는 시스템 호출이 write라는 것을 뜻함
    mov       rdi, 1       ; rdi 레지스터에 1을 저장 / rdi(값을 출력할 파일의 descriptor) 가 1이라는 것은 표준 출력을 의미 
    mov       rsi, msg2 ; rsi 레지스터에 메세지("Hello World" 담고있는 변수) 저장
    mov       rdx, 16      ; 문자열의 길이 저장
    syscall  


    mov       rax, 60      ; 시스템 정상종료 하도록 exit 시스템 호출
    xor       rdi, rdi     ;  ''
    syscall                ;  ''
    section   .data                    ; 문자열이 데이터 영역에 담겨 있기 때문에 데이터 영역을 선언해준다
    msg1 db        "Hello, World", 10       ; 10은 개행문자('\n'의 아스키 코드 값)
    msg2 db        "My name is John", 10

   ```