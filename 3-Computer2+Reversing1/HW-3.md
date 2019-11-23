# 과제 

1. 자신의 실험 결과에 대한 write-up 을 쓰세요. 

  - 사람은 어떤 학문을 이해하든지 간에 그 학문이 정말로 맞는지 확인하기 위해 자신만의 실험을 하기 마련이다. 특히 컴퓨터 공학은 그러한 실험이 많이 일어나는데 어제의 내용과 오늘의 내용을 이해하기 위해서 자신이 했던 생각이나 의문이나 고민을 write-up 에 작성하고 그 생각과 의문과 고민을 해결하기 위해서 시도했던 실험과 실험 결과를 write-up 에 작성하시오. 

  - 아직 감이 잡히지 않은 사람들을 위해 예시를 들어보자. 

    ```c
    // https://github.com/nffive/test_virt_memory
    #include <stdio.h>
    #include <stdlib.h>
    #include "libkdump.h"
    
    int data = 5555;
    int bss = 0;
    int bss2;
    
    void text(){ 1+1 == 2; }
    
    int main(int argc, char * argv[]){
        static char * data2 = "twice";
        int stack = 78;
        int stack2 = 23;
        int * heap = (int *)malloc(sizeof(int));
        int * heap2 = (int *)malloc(sizeof(int));
        char * environment_variable = getenv("PATH");
    
        printf("Let's check address of each memory section from BOTTOM to TOP.\n");
        printf("Text  section : %p\n", text);
        printf("Data  section : %p\n", &data);
        printf("              : %p\n", &data2);
        printf("BSS   section : %p\n", &bss);
        printf("              : %p\n", &bss2);
        printf("Heap  section : %p\n", heap);
        printf("              : %p\n", heap2);
        printf("Stack section : %p\n", &stack);
        printf("              : %p\n", &stack2);
        printf("Main argument : %p\n", argv);
        printf("Environment   : %p\n", environment_variable);
        printf("All of these are Virtual Address\n\n");
    
        printf("Let's check physical address(Real Address)!\n");
        void * physical_text = libkdump_virt_to_phys((size_t)text);
        if (physical_text == NULL) {
            puts("\x1b[31mIf you want to see physical memory address, reexecute with root privileges!");
            return 1;
        }
        printf("Text  section : %p\n", physical_text);
        printf("Data  section : %p\n", libkdump_virt_to_phys((size_t)&data));
        printf("              : %p\n", libkdump_virt_to_phys((size_t)&data2));
        printf("BSS   section : %p\n", libkdump_virt_to_phys((size_t)&bss));
        printf("              : %p\n", libkdump_virt_to_phys((size_t)&bss2));
        printf("Heap  section : %p\n", libkdump_virt_to_phys((size_t)heap));
        printf("              : %p\n", libkdump_virt_to_phys((size_t)heap2));
        printf("Stack section : %p\n", libkdump_virt_to_phys((size_t)&stack));
        printf("              : %p\n", libkdump_virt_to_phys((size_t)&stack2));
        printf("Main argument : %p\n", libkdump_virt_to_phys((size_t)argv));
        printf("Environment   : %p\n", libkdump_virt_to_phys((size_t)environment_variable));
        return 0;
    }
    ```

  - 본문에는 위와 같은 C 프로그램이 있었다. 사실 이 C 프로그램 자체가 내가 메모리 구조에 대한 설명을 듣고 나서 메모리 구조가 정말로 TEXT 영역, DATA 영역, BSS 영역, HEAP 영역, STACK 영역, MAIN 함수의 인자의 순서로 이루어져있는지 확인해 보려고 한 실험의 결과물이다. 나는 컴퓨터가 프로그램을 실행할 때 메모리 구조를 어떻게 할당하는지 의문이 들었고 그 의문과 고민을 해결하기 위해서 저러한 C 프로그램으로 실험을 해본 것이다. 여러분도 어떤 내용에 대해서 의문이 들 수도 있고 좀 더 깊게 이해해보고 싶은 호기심이 생길 수도 있다. 그리고 컴퓨터 공학은 그러한 의문과 호기심이 곧바로 실험으로 연결된다. 직접 본인이 실험해봄으로써 의문을 풀거나 호기심을 해결하는 것이다. 

  - 또 다른 예시로써 예를 들어 지난 시간에 알아봤던 괴델의 불완전성 정리에 대한 설명을 듣고 정말로 "참이지만 증명 불가능한 명제가 존재하는지" 알아보고 싶어서 그 정리의 증명에 대해서 좀 더 알아보았고 알아본 결과는 어떠했다 라고 써도 좋다. 
     
  - 너무 거창하게 하려고 하지 않아도 되고 순수하게 자신의 호기심과 의문과 생각을 해결하기 위한 소소한 실험에 대한 결과를 써도 된다. 소소하게 나는 printf 함수가 내부적으로 write 함수를 사용하고 write 함수가 1 번 syscall 을 사용한다는 설명을 듣고 scanf 함수는 내부적으로 어떤 어셈블리어로 구성되어있는지 궁금해졌다. 그래서 알아보았더니 이러이러 했다 와 같은 식으로 써도 좋다. 

2. 리버싱 문제를 풀고 write-up 을 쓰세요.

  - 먼저 다음의 명령어를 참고해서 리버싱 문제를 내려받자.

    ```shell
    wget http://security.cs.rpi.edu/courses/binexp-spring2015/lectures/2/challenges.zip
    unzip challenges.zip
    cd challenges
    ls
    ```

  - 그러면 crackme 라는 프로그램들이 보인다. 이 프로그램들은 실행하면 비밀번호를 묻는다. 즉 비밀번호를 아는 권한이 있는 사용자만이 이 프로그램을 사용할 수 있는 것이다. 하지만 gdb 로 리버싱을 해서 비밀번호를 알아낸 후 프로그램을 크래킹해보자. 만약 비밀번호가 틀렸다면 `Wrong!` 같은 문장이 보일 것이고 비밀번호를 맞췄다면 `Congrats!` 같은 문장이 출력될 것이다.

  - 프로그램들은 crackme0x0N 의 형식으로 되어있는데 N 의 숫자가 클 수록 어려운 문제이다. 

  - (필수) crackme0x00a, crackme0x00b 

  - (옵션) 풀 수 있는 데까지 풀어보세요. 

3. 아무거나 쓰세요 

