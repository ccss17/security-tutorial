# 과제 

1. 자신의 실험 결과에 대한 write-up 을 쓰세요. 

    - 사람은 어떤 학문을 이해하든지 간에 그 학문이 정말로 맞는지 확인하기 위해 자신만의 실험을 하기 마련이다. 특히 컴퓨터 공학은 그러한 실험이 많이 일어나는데 어제의 내용과 오늘의 내용을 이해하기 위해서 자신이 했던 생각이나 의문이나 고민을 write-up 에 작성하고 그 생각과 의문과 고민을 해결하기 위해서 시도했던 실험과 실험 결과를 write-up 에 작성하시오. 
  
    - 아직 감이 잡히지 않은 사람들을 위해 예시를 들어보자. 

    ```c
    // https://github.com/ccss17/test_virt_memory
    #include <stdio.h>
    #include <stdlib.h>
    #include "libkdump.h"

    #define R "\033[31m"
    #define G "\033[32m"
    #define B "\033[34;1m"
    #define E "\033[0m"

    int data = 5555;
    int bss = 0;
    int bss2;

    void text(){ 1+1 == 2; }

    int main(int argc, char * argv[]){
        if (argc != 3) {
            fputs(R "Please pass TWO arguments...\n" E , stderr);
            return 1;
        }
        static char * data2 = "twice";
        int stack = 78;
        int stack2 = 23;
        int * heap = (int *)malloc(sizeof(int));
        int * heap2 = (int *)malloc(sizeof(int));
        char * environment_variable = getenv("PATH");

        printf("Let's check addresses of each memory section of virtual memory system.\n");
        printf(G"Text  section " E " : " B "%p\n", text);
        printf(G"Data  section " E " : " B "%p\n", &data2);
        printf(G"              " E " : " B "%p\n", &data);
        printf(G"BSS   section " E " : " B "%p\n", &bss);
        printf(G"              " E " : " B "%p\n", &bss2);
        printf(G"Heap  section " E " : " B "%p\n", heap);
        printf(G"              " E " : " B "%p\n", heap2);
        printf(G"Main arg-argc " E " : " B "%p\n", &argc);
        printf(G"Stack section " E " : " B "%p\n", &stack);
        printf(G"              " E " : " B "%p\n", &stack2);
        printf(G"Main arg-argv " E " : " B "%p\n", argv);
        printf(G"     argv[1]  " E " : " B "%p\n", argv[1]);
        printf(G"     argv[2]  " E " : " B "%p\n", argv[2]);
        printf(G"Env variable  " E " : " B "%p\n", environment_variable);
        printf(R "These are Virtual Address\n\n"E);

        printf("Let's check physical addresses(Real Address)!\n");
        void * physical_text = libkdump_virt_to_phys((size_t)text);
        if (physical_text == NULL) {
            puts(R "If you want to see physical memory address, reexecute with root privileges!"E);
            return 1;
        }
        printf(G"Text  section " E " : " B "%p\n", physical_text);
        printf(G"Data  section " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&data2));
        printf(G"              " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&data));
        printf(G"BSS   section " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&bss));
        printf(G"              " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&bss2));
        printf(G"Heap  section " E " : " B "%p\n", libkdump_virt_to_phys((size_t)heap));
        printf(G"              " E " : " B "%p\n", libkdump_virt_to_phys((size_t)heap2));
        printf(G"Main arg-argc " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&argc));
        printf(G"Stack section " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&stack));
        printf(G"              " E " : " B "%p\n", libkdump_virt_to_phys((size_t)&stack2));
        printf(G"Main argument " E " : " B "%p\n", libkdump_virt_to_phys((size_t)argv));
        printf(G"     arg-argv " E " : " B "%p\n", libkdump_virt_to_phys((size_t)argv));
        printf(G"     argv[1]  " E " : " B "%p\n", libkdump_virt_to_phys((size_t)argv[1]));
        printf(G"     argv[2]  " E " : " B "%p\n", libkdump_virt_to_phys((size_t)argv[2]));
        printf(G"Env variable  " E " : " B "%p\n", libkdump_virt_to_phys((size_t)environment_variable));
        printf(R "These are real Physical Address\n"E);
        return 0;
    }
    ```

    - 본문에는 위와 같은 C 프로그램이 있었다. 사실 이 C 프로그램 자체가 내가 메모리 구조에 대한 설명을 듣고 나서 메모리 구조가 정말로 TEXT 영역, DATA 영역, BSS 영역, HEAP 영역, STACK 영역, MAIN 함수의 인자의 순서로 이루어져있는지 확인해 보려고 한 실험의 결과물이다. 나는 컴퓨터가 프로그램을 실행할 때 메모리 구조를 어떻게 할당하는지 의문이 들었고 그 의문과 고민을 해결하기 위해서 저러한 C 프로그램으로 실험을 해본 것이다. 여러분도 어떤 내용에 대해서 의문이 들 수도 있고 좀 더 깊게 이해해보고 싶은 호기심이 생길 수도 있다. 그리고 컴퓨터 공학은 그러한 의문과 호기심이 곧바로 실험으로 연결된다. 직접 본인이 실험해봄으로써 의문을 풀거나 호기심을 해결하는 것이다. 
  
    - 또 다른 예시로써 예를 들어 지난 시간에 알아봤던 괴델의 불완전성 정리에 대한 설명을 듣고 정말로 "참이지만 증명 불가능한 명제가 존재하는지" 알아보고 싶어서 그 정리의 증명에 대해서 좀 더 알아보았고 알아본 결과는 어떠했다 라고 써도 좋다. 
       
    - 너무 거창하게 하려고 하지 않아도 되고 순수하게 자신의 호기심과 의문과 생각을 해결하기 위한 소소한 실험에 대한 결과를 써도 된다. 소소하게 나는 printf 함수가 내부적으로 write 함수를 사용하고 write 함수가 1 번 syscall 을 사용한다는 설명을 듣고 scanf 함수는 내부적으로 어떤 어셈블리어로 구성되어있는지 궁금해졌다. 그래서 알아보았더니 이러이러 했다 와 같은 식으로 써도 좋다. 

    - 이 숙제의 예시 

      - [27기 Kong 님](Kong.md)

      - [27기 hayeong 님](hayeong.md)

      - [27기 jiniljeil 님](jiniljeil.md)

      - [27기 pyojunCode 님](pyojunCode.md)

2. 아무거나 쓰세요 
