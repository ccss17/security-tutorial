# 과제 

1. 어셈블리어로 된 프로그램을 분석해보세요 

  - 어셈블리 파일 컴파일 가이드 : (고스트 서버에서 실습하시길 바랍니다.) 어셈블리어로 코딩된 파일은 .asm 으로 되어 있다. hello.asm 을 컴파일 후 실행하고 싶다면 다음과 같이 할 수 있다. 

    ```shell
    nasm -felf64 hello.asm
    ld -s hello.o -o hello
    ./hello
    ```

  - [hello.asm](hello.asm) 파일과 [strlen.asm](strlen.asm) 파일을 컴파일하고 실행 해본 후 코드를 분석한 write-up 을 쓰세요.

2. hello.asm 을 업그레이드 하세요.

  - 기존의 hello.asm 실행시 `Hello, World` 출력 되었다 하지만 업그레이드 버전은 다음과 같은 내용을 출력할 수 있어야 한다. 

    ```shell
    Hello, World
    My name is {자신의이름}
    ```

  - 업그레이드한 hello.asm 을 hello_name.asm 으로 저장한 후 HW-2 디렉토리에 포함시켜서 커밋 후 푸쉬하세요. 

3. hello.asm 업그레이드(2) (옵션)

  - 사용자가 인자를 입력하면 예를들어서 `./hello chansol` 입력하면 다음과 같이 출력할 수 있도록 만드세요 .

    ```shell
    Hello, World
    My name is {전달한 인자}
    ```

4. 아무거나 쓰세요 
