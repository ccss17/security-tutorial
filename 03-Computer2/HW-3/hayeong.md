# GBC Security_03

## HW #3

### 1. 자신의 실험 결과에 대한 write-up
---
#### 1. Review

* 가상메모리는 커널 영역과 사용자 영역으로 나뉜다.
* 커널 영역 : 커널 관련 메모리 로드, 시스템 콜을 통해서만 접근 가능
* 사용자 영역 : stack(함수의 인자, 함수의 리턴 주소값, 지역 변수), heap(동적 할당 메모리), BSS(초기화x, 0으로 초기화된 전역, static변수), data(초기화된 전역, static 변수), text(실행될 어셈블리어들이 저장됨)

#### 2. wirte-up (1)
* 스택 영역에 메모리가 저장되는 과정을 정확히 이해하지 못해서 다시 공부해보았다.  
* c코드로는 메모리 사용을 알 수 없는데, 어셈블리 코드로 보면 그 과정이 전부 나와있는 것을 알았다. 
* 함수 호출 시와 함수 인자 전달 시에, 스택에서 어떤 일들이 일어나는지 알아보고 싶어서 간단한 c코드를 gdb로 디버깅하여 어셈블리어 코드를 살펴보았다.

> 다음과 같은 c코드를 gdb로 디버깅한다.


```{.c}
#include <stdio.h>

int add(int x, int y);
int main(){
    int x = 5, y = 10;
    int result = add(x, y);
    printf("result = %d\n", result);
}
int add(int x, int y){
    return x + y;
}
```
> 컴파일 시, 디버그 모드로 컴파일하면 소스코드를 같이 볼 수 있다.

![hw0](https://user-images.githubusercontent.com/47182864/61030788-22f24e00-a3f9-11e9-893c-39468370e0c9.png)

> c코드에서 int형 변수 x와 y를 각각 5와 10으로 초기화했는데, 어셈블리 코드에서는 *main+4의 sub rsp, 0x10으로 스택에 0x10만큼의 공간을 할당한 후, mov 명령어로 스택의 공간 [rbp-0xc]에 5를, [rbp-8]에 10을 넣어주고 있다. _변수를 2개 선언하면 스택의 2개의 공간에 저장된다._
0x10만큼의 공간에는 int형 변수를 4개까지 담을 수 있으며, 변수 선언을 5개 할 경우에는 스택에 할당하는 크기 또한 증가한다. (0x20)

![hw1](https://user-images.githubusercontent.com/47182864/61030790-238ae480-a3f9-11e9-8f07-b34bab8359a4.png)


??? 함수 호출 시, 스택의 이용을 보고 싶어서 해봤는데 지역변수 저장하는 것밖에 볼 수 없었다. 너무 간단한 함수라 그런가 호홓호ㅎ?ㅜㅜ

> `ret`: CPU가 함수를 호출해서 프로그램의 흐름을 바꿀 때 `call`을 사용하고, 원래 있던 곳으로 되돌아 갈 때 `ret` 명령어를 사용한다. call 명령어가 스택에 저장해놓은 return 주소값을 Pop해서 rip레지스터에 저장해준다고 어제 찬솔님이 설명하셨다.

![hw1-2](https://user-images.githubusercontent.com/47182864/61031122-d4917f00-a3f9-11e9-9f35-121dcf0798d3.png)

* 찾다보다 보니 이거 c배울때 배웠던 것 같다ㅎㅎㅎ. 다시 보자!

> 스택 프레임 : 함수 호출시 할당되는 메모리 블록
> 함수 호출이 완료되면, 기존에 선언된 지역변수에 접근이 불가능하다. (할당된 메모리 반환되므로)
> 아래 그림에서, fct2() 함수가 호출되면서 함수 내부에 선언된 변수 e, h가 스택에 할당 -> 이 메모리 블록이 fct2()의 스택 프레임이라 한다.

![hw5](https://user-images.githubusercontent.com/47182864/61034071-88493d80-a3ff-11e9-9fe1-295ec58af534.png)

> sp register : 스택 프레임을 가리키는 레지스터 (32bit : esp , 64bit : rsp)
> sp는 변수가 할당될 때마다 증가하면서, 다음 변수가 할당될 메모리 위치를 가리킨다.


![hw5-1](https://user-images.githubusercontent.com/47182864/61034067-87b0a700-a3ff-11e9-8bf2-809101316307.png)

* breakpoint를 add()함수로 걸고 다시 어셈블리 코드를 살펴보면 스택 현황을 볼 수 있었다!!!

 ![add](https://user-images.githubusercontent.com/47182864/61036160-7ff30180-a403-11e9-975c-163ea1088c86.png)

#### 3. write-up (2)
* malloc으로 할당한 메모리는 정말 힙 영역으로 구분되어 있을까 ?! 이것도 어셈블리 코드로 확인해보기로 했다!  

> 이번에도 간단한 코드를 작성해서...

```{.c}
#include <stdio.h>
#include <stdlib.h>
 
int main(){
    int *m = NULL;
    m = (int*)malloc(20 * sizeof(int));
 
    for(int i = 0; i < 20; i++){
        m[i] = i;
    }
 
    for(int i = 0; i < 20; i++){
        printf("%d\n", i);
    }
 
    free(m);
    return 0;
}
```
> debug 모드로 컴파일하여 gdb로 열어본다. for문을 돌면서 malloc을 이용한 배열 m[i]에 값을 할당해줄때, heap영역이 이용되는 것을 볼 수 있다. 파란색으로 표시된 것이 heap영역, 노란색으로 표시된 것이 stack영역이다.

![heap](https://user-images.githubusercontent.com/47182864/61032802-1b34a880-a3fd-11e9-9727-35e75fa48181.png)
