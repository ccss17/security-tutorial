# 어셈블리어 (2)

## 비트 연산 (`shl`, `shr`)

C 언어에서 비트 쉬프트 << 과 >>, ~ 은 내부적으로 shl, shr, not 어셈블리어를 사용한다. 

- `shl <dest> <src>` : `<dest> = <dest> << <src>` 의 의미이다. 

  - SHift Left 의 줄임말이다.
  
  - `1` 번 쉬프트 하면 `2`배 커지고 `2` 번 쉬프트하면 `2^2` 배 커진다. 
  
  - `n` 번 쉬프트 하면 `2^n` 배 커진다. 

  ```assembly
  shl ax, 8  
  shl eax, cl
  ```

- `shr <dest> <src>` : `<dest> = <dest> >> <src>` 의 의미이다.

  - SHift Right 의 줄임말이다. 
  
  - `1` 번 쉬프트 하면 `2`배 나눠지고 `2` 번 쉬프트하면 `2^2` 배 나눠진다. 
  
  - `n` 번 쉬프트 하면 `2^n` 배 나눠진다. 

  ```assembly
  shr rcx, 32     
  shr qword[qNum], cl   
  ```

  - 비트 이동 연산자는 다음 그림과 같이 동작한다. 

  ![shift](https://user-images.githubusercontent.com/16812446/72771257-abbd3280-3c43-11ea-9b13-dc195ca35009.PNG)


## 메모리 관리

사용자가 프로그램을 실행하면 HDD 또는 SSD 에 저장되어 있던 프로그램의 바이너리가 RAM 으로 복사된다. RAM 에 로드된 프로그램을 프로세스라고 부르는데 CPU 는 RAM 에서 이 프로세스를 읽으면서 명령을 수행한다. 

![CPU execute](http://math.hws.edu/javanotes/c1/overview-fig1.PNG)

현대의 컴퓨터는 프로그램을 HDD 또는 SSD 에서 RAM 으로 로드할 때 가상 메모리 시스템으로 관리한다. `64` 비트 시스템에서는 `0x0000000000000000` 부터 `0xffffffffffffffff` 까지의 가상 메모리 영역이 하나의 프로세스에 할당된다. 즉 실질적인 물리적 주소를 할당하는 것이 아니라 가상의 메모리 영역을 할당하는 것이다.

### 가상 메모리 시스템의 메모리 영역

프로그램 바이너리가 RAM 에 로드될 때 할당되는 가상 메모리는 두 영역으로 나뉜다. 하나는 커널 영역, 하나는 사용자 영역이다. 커널영역은 커널 관련 메모리가 로드되고 시스템 콜을 통해서만 접근할 수 있다. 실제 실행될 프로그램은 사용자 영역에 5 등분되서 로드되는데 스택Stack, 힙Heap, BSS 영역, Data 영역, Text 영역이 그것이다.

- 스택Stack : 함수의 인자, 함수의 리턴 주소값, 지역 변수가 로드된다.

- 힙Heap : 동적 할당 메모리(malloc, new 등) 가 저장된다.

- BSS 영역 : 초기화되지 않았거나 0 으로 초기화된 전역변수, static 변수들이 저장된다.
  
- Data 영역 : 초기화된 전역변수, static 변수들이 Data 영역에 저장된다.

- Text 영역 : 실행될 어셈블리어들이 저장된다. 

  ![memory layout](https://notes.shichao.io/tlpi/figure_6-1.png)

  - 위의 그림처럼 가장 낮은 주소부터 Text 영역, Data 영역, BSS 영역, Heap 영역, Stack 영역, 그리고 메인함수의 인자와 환경변수, 가장 높은 주소에 커널 영역이 저장된다.
  
  - 이 영역들은 모두 가상 메모리 영역이고 주소값도 가상 주소값이다.
  
  - 게임이든, 문서작업이든, 카카오톡이든 컴퓨터의 어떤 프로그램이라도 이런 식으로 가상 메모리가 할당이 된다. 
    
    ![물리메모리](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Virtual_memory.svg/379px-Virtual_memory.svg.PNG)

  - 그리고 그러한 가상 메모리 영역은 위와 같이 적절히 쪼개져서 물리 메모리, 즉 실제 메모리에 저장된다. 만약 실제 메모리가 부족할 경우 HDD 또는 SSD 를 사용하게 된다.
    
  - 가상 메모리를 사용하게 되면 메모리 주소값을 일관되게 사용할 수 있고 만약 RAM 이 부족하면 HDD 또는 SSD 를 사용할 수 있게 된다.
    
  - `적절히 쪼개진다(Paging 기법)` 는 것이 구체적으로 어떻게 되는 것인지 설명하려면 한 학기가 필요할테니 운영체제 강의를 들으시며 배우시길 바랍니다.

#### 가상 메모리 영역과 물리 메모리 영역 확인해보기 

[check_virtual_memory_structure.c](https://github.com/ccss17/test_virt_memory/blob/master/check_virtual_memory_structure.c)

위 프로그램은 텍스트 영역, 데이터 영역, BSS 영역, 힙 영역, 스택 영역의 가상 메모리 주소와 그에 따른 물리 메모리 주소를 확인해볼 수 있는 간단한 C 프로그램이다.

```shell
git clone https://github.com/ccss17/test_virt_memory
cd test_virt_memory
make
sudo ./check_virtual_memory_structure HELLO WOLRD
```

이러한 명령어로 컴파일 한 후 실행하여 실습을 해볼 수 있고 실행 결과는 다음과 같다. 

![addr-test](https://user-images.githubusercontent.com/16812446/73173290-623f7c80-4148-11ea-8b84-1caac1f4a712.png)

가상 메모리 주소값은 `Text`, `Data`, `BSS`, `Heap`, `Stack` 순으로 저장되지만 실제 물리 메모리 주소값은 이 `5` 가지 메모리 섹션 순으로 저장되지는 않은 모습을 확인할 수 있다. 또한 메인 함수의 인자 개수를 나타내는 `argc` 는 스택의 맨 밑바닥에 있고 실제 인자를 가르키는 `argv` 배열은 스택보다 위에 있는 것을 알 수 있다. 따라서 메인 함수에 전달된 인자가 크면 클 수록 스택 영역 주소가 밑으로 할당될 것이다. 

---

## 스택 메모리 관리

스택 메모리는 LIFO (Last-In, First-Out) 법칙으로 관리된다. 가장 마지막에 들어온 값이 가장 먼저 제거된다. 

`a = {7, 19, 37}` 이라는 배열을 생각해보자. 

```assembly
push a[0]
push a[1]
push a[2]

pop a[0]
pop a[1]
pop a[2]
```

그리고 그 배열에 대하여 위와 같은 6개 명령어를 실행시켰다. 

![pushpop](https://user-images.githubusercontent.com/16812446/72771274-c2fc2000-3c43-11ea-8161-bc6040289e33.PNG)


그러면 스택 메모리는 각각의 `6` 개의 명령어마다 위의 그림과 같이 변하고 배열 `a` 는 `{37, 19, 7}` 이 된다. `push` 로 값이 스택에 저장된 후 `pop` 으로 스택의 가장 위에 있는 값이 제거 되면서 저장되는 것이다. 

- `push <op>` : 전달된 값을 스택의 가장 위(`rsp`) 저장한다.

  - `push` 는 내부적으로 `rsp` 레지스터를 사용해서 스택의 최상위 주소를 알아내고 그 주소에 값을 저장한다. 그런데 `64` 비트 메모리 시스템의 스택에에서는 `8` 바이트 값이 저장되니까 스택이 `8` 만큼 커진다. 그래서 `rsp` 에 저장된 값이 `8` 을 감소된다. 

  - `rsp` 에 `8` 을 더하는 게 아니라 왜 뺄까? [메모리 레이아웃](https://notes.shichao.io/tlpi/figure_6-1.png) 에서도 확인할 수 있듯이 스택은 높은 주소에서 낮은 주소로 확장되기 때문이다. 

    ```assembly
    push rax            ; rax 의 값을 스택에 저장하고 rsp 값에 8 을 뺀다. 
    push qword [qVal]   ; qVal 의 메모리 주소에 있는 값을 스택에 저장하고 rsp 값에 8 을 뺀다.
    ```

- `pop <op>` : 스택의 가장 위(`rsp`)에 있는 값을 `<op>` 에 저장하고 스택을 `8` 만큼 줄여준다.

  - 스택의 가장 위는 `rsp` 가 가르키고 있으니 결국 `rsp` 의 주소값에 있는 값을 `<op>` 에 저장한다는 말이다. 그리고 스택을 줄여주어야 하니 `rsp` 에 `8` 을 더한다. 

    ```assembly
    pop rax            ; rsp 가 가르키고 있는 스택의 최상위 주소의 데이터를 rax 에 저장하고 rsp 값에 8 을 더한다.
    pop qword [qVal]   ; rsp 가 가르키고 있는 스택의 최상위 주소의 데이터를 qVal 의 메모리 주소에 에 저장하고 rsp 값에 8 을 더한다.
    ```

---

## 기타 명령어 

### test 명령어

- `test <op1> <op2>` : `<op1>` 과 `<op2>` 의 AND 연산 결과가 `0` 일 때 FLAG 레지스터의 Zero Flag, 즉 ZF 를 `True` 로 세팅한다. 

  - 한편 `je` 명령어는 ZF 가 True 로 세팅되어 있을 때 점프한다. 그래서 `je` 명령어는 jump-if-zero 와도 같은 말이다. `cmp` 명령어는 두 값을 비교한다고 이해했는데 실제로는 `cmp <op1> <op2>` 는 `<op1>` 에서 `<op2>` 를 빼서 결과값이 0 이면 FLAG 레지스터의 ZF 를 True 로 세팅한다. 그래서 이후에 `je` 명령어가 FLAG 레지스터의 ZF 플래그가 True 로 세팅되어 있으면 점프하게 되고 세팅되어 있지 않으면 점프하지 않는다. 반대로 `jne` 을 jump-if-not-zero 와도 같다고 이해하면 된다. 

  ```assembly
  test eax, eax
  je <locatoin>
  ```

  - 그래서 위와 같은 어셈블리어가 있을 때 `eax` 가 `0` 이 아니라면 `eax` 와 `eax` 의 AND 연산 결과는 `0` 이 아니다. 따라서 FLAG 레지스터의 ZF 플래그가 세팅되지 않을 것이고 `je` 는 점프하지 않는다. 한 마디로 `eax` 가 `0` 일 때 점프하라는 의미이다. 

### sete 명령어

- `sete <reg>` : ZF (Zero Flag) 가 세팅되어 있다면 `<reg>` 를 `1` 로 만들고 그렇지 않으면 `0` 으로 만든다. 

### nop 명령어 

- `nop` : 아무 일도 하지 않고 다음 명령어로 넘어간다. 

  - **NOP** 코드는 다음에 배울 **쉘코드**를 생성할 때 유용하게 사용된다. 

  - **NOP** 코드는 바이너리로 `0x90` 이다. *예외적으로 **NOP** 코드만큼은 바이너리 값(0x90)을 암기할 필요가 있다.*

### 나머지 어셈블리어들은?

http://www.jegerlehner.ch/intel/IntelCodeTable.pdf

이렇게 핵심 어셈블리어를 이해해보았기 때문에 나머지 어셈블리어도 스스로 충분히 이해할 수 있을 것이다. 모르는 어셈블리어가 나오면 구글에 검색해보아도 되고 위의 레퍼런스를 참고해도 된다. 

---

# gdb 사용법 (1)

**GNU Debugger** 라고도 하는 `gdb` 란 대중적으로 많이 사용되는 디버깅 툴이다. 프로그램의 작동의 정확성과 논리적 오류를 검증하기 위한 과정을 일컫는 디버깅으로 소스코드로 프로그램을 정적으로 분석하는 것에서 더 나아가서 런타임상에서 프로그램을 동적으로 분석할 수 있다. 디버깅 툴은 `radare2`, `lldb`, `rr-project`, `ida`, `ollydbg` 등등이 있지만 이번에는 `gdb` 로 프로그램을 디버깅하는 가장 기초적인 방식을 알아보자. 

## gdb 명령어 (1) - 기초 명령어 

- `$ gdb <program>` : gdb 디버깅 시작 

- `(gdb) run` or `r` : 프로그램 시작 

- `(gdb) break <location>` or `b` : 브레이크포인트 지정 

  - `(gdb) break main` or `b main`

  - `(gdb) break 0x408571` or `b 0x408571`

- `(gdb) info breakpoints` or `i b` : 브레이크포인트 상태보기 

- `(gdb) delete breakpoints <location>` or `d br <location>` : 브레이크포인트 삭제 

- `(gdb) nexti` or `ni` : 하나의 명령어씩 실행. 단, 서브루틴으로 들어가지 않음 

- `(gdb) stepi` or `si` : 하나의 명령어씩 실행. 단, 서브루틴으로 들어감 

- `(gdb) next` or `n` : 소스코드 한 줄을 실행. 단, 서브루틴으로 들어가지 않음 

- `(gdb) step` or `s` : 소스코드 한 줄을 실행. 단, 서브루틴으로 들어감

- `(gdb) continue` or `c` : 브레이크 포인트를 무시하고 프로그램이 끝날 때가지 실행

- `(gdb) x/<n-bytes>x <location>` : 해당 주소로부터 메모리를 n byte 를 본다. 

  - `(gdb) x/10x <location>` : 해당 주소로부터 메모리를 10 byte 를 본다. 

- `(gdb) disas <function>` : 함수의 어셈블리어를 본다. 

## gdb 연습 (1) - 간단한 C 프로그램 

### 프로그램 준비 및 컴파일 

먼저 [add.c](add.c) 을 저장합니다.

  - [add.c](add.c) 소스코드 :

    ```c
    #include <stdio.h>

    int add(int n1, int n2)
    {
        puts("Hello World!");
        return n1 + n2;
    }

    int main(void)
    {
        int a = 8;
        int b = 1024;
        int result = add(a, b);
        printf("a + b = %d\n", result);
        return 0;
    }
    ```

그리고 컴파일을 하고 실행해봅니다. 

```shell
$ gcc add.c -o add
$ ./add
a + b = 1032
```

### gdb 로 디버깅하기 

이제 `gdb` 로 디버깅을 해봅시다. 다음 명령어로 디버깅을 실습해보죠. 그리고 다른 명령어들도 스스로 실행해보고 어떻게 작동하는지 이해해봅시다. 

```shell
$ gdb add
(gdb) i file      # info files : 프로그램의 정보를 보는 명령 
(gdb) i func      # info functions : 프로그램의 함수들을 보는 명령 
(gdb) b main      # break main : main 함수에 브레이크포인트를 걸어서 main 함수가 시작될 때 프로그램이 멈춘다. 
(gdb) i b         # info breakpoints : 현재 설정된 브레이크포인트를 본다.
(gdb) d br 1      # delete breakpoint 1 : 1 번 브레이크포인트를 삭제
(gdb) b main      # 다시 main 함수에 브레이크포인트 설정 
(gdb) r           # run : 프로그램을 실행 
(gdb) disas main  # main 함수의 어셈블리를 본다 
(gdb) ni          # nexti : 하나의 명령어 씩 실행. 단, 서브루틴으로 들어가지 않음. 
(gdb) ni          # ni 를 계속 실행하면서 레지스터와 메모리가 변하는 상황을 관찰해본다. 
(gdb) si          # stepi : 하나의 명령어 씩 실행. 단, 서브루틴으로 들어감.
(gdb) si          # si 를 실행하면 call 된 함수의 루틴으로 계속해서 들어간다. 
(gdb) c           # continue : 다음 브레이크포인트까지 프로그램을 진행시킴. 브레이크포인트가 없으면 프로그램이 끝날 때까지 진행시킴. 
```

# gdb 플러그인  

`gdb` 는 매우 유용한 디버거이지만 아무런 플러그인이 없는 바닐라 `gdb` 를 사용할 경우 디버깅이 너무 힘들어진다. 그래서 `gdb` 를 위한 [여러 오픈소스 프로젝트](https://awesomeopensource.com/projects/gdb) 가 있는데 크게 `UI` 중심, `Exploit` 중심으로 나뉜다. 

- `Exploit` 중심 플러그인 : `gdb` 로 프로그램을 쉽게 해킹할 수 있는 기능을 제공한다. 

  - https://github.com/jfoote/exploitable

  - https://github.com/rogerhu/gdb-heap

- `UI` 중심 플러그인 : 디버깅 상태를 쉽게 이해할 수 있는 레이아웃으로 보여준다. 

  - https://github.com/cyrus-and/gdb-dashboard
   
  - https://github.com/snare/voltron

- `UI` 와 `Exploit` 기능을 균형있게 제공하는 플러그인

  - https://github.com/hugsy/gef

  - https://github.com/pwndbg/pwndbg

이제부터 `pwndbg` 를 사용해서 디버깅을 해보자. (*개인적으로 레이아웃은 `voltron` 으로 쓰고 명령어 체계를 `pwndbg` 로 사용하는 것을 선호한다.*)

# pwndbg 

`pwndbg` 환경에서 `gdb` 로 프로그램을 디버깅하기 시작하면 다음과 같은 화면을 볼 수 있습니다. 

![gdb](https://user-images.githubusercontent.com/16812446/72771285-cee7e200-3c43-11ea-867a-46b44f415bbd.png)

- **RESIGSTERS** 섹션은 현재 레지스터에 저장된 값들을 보여준다. 

- **DISASM** 은 실행될 어셈블리어들을 보여준다. 

- **STACK** 은 스택 메모리 영역을 보여준다. 

- **BACKTRACE** 는 함수 호출 관계를 보여준다. 

---

# 함수 호출의 컴퓨터 내부적인 원리 

## 서브루틴 호출(`call`, `ret` 명령어)

[add.c](add.c) 를 다시 살펴보자. 그리고 이 프로그램의 `main` 함수의 어셈블리어를 해부해보자. `objdump` 로 어셈블리어를 확인할 수 있다. 

```shell
$ objdump -M intel -D add | grep \<main\> -A19
0000000000400588 <main>:
  ...
  400590:	c7 45 f4 08 00 00 00 	mov    DWORD PTR [rbp-0xc],0x8
  400597:	c7 45 f8 00 04 00 00 	mov    DWORD PTR [rbp-0x8],0x400
  40059e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  4005a1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4005a4:	89 d6                	mov    esi,edx
  4005a6:	89 c7                	mov    edi,eax
  4005a8:	e8 b9 ff ff ff       	call   400566 <add>
  4005ad:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  ...
```
```shell
$ objdump -M intel -D add | grep \<add\>: -A12
0000000000400566 <add>:
  ...
  400574:	bf 54 06 40 00       	mov    edi,0x400654
  400579:	e8 b2 fe ff ff       	call   400430 <puts@plt>
  40057e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  400581:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  400584:	01 d0                	add    eax,edx
  400586:	c9                   	leave
  400587:	c3                   	ret
```

`main` 함수에서 `call` 을 사용해서 `add` 함수로 뛰고 `add` 함수가 끝나면 `ret` 명령어로 다시 `main` 함수로 되돌아오게 된다. 

- `call <location>` : "**`call` 의 다음 명령어의 주소값**"을 스택에 `push` 하고, `<location>` 의 값을 `rip` 에 덮어쓴다.

  - 스택에 저장된 "**`call` 의 다음 명령어의 주소값**" 을 *부모 함수의 실행흐름으로 되돌아갈 수 있는 표지판 역할*을 하기에 "**리턴 주소값**" 이라 부른다.
  
  - **이 리턴주소값을 어떻게 조작하느냐에 따라 프로그램의 흐름도 조작하여 해커가 원하는대로 실행시킬 수 있기 때문에** 리턴주소값은 해킹에서 중요하게 다뤄진다.

  - 해커가 원하는 것은 해당 프로세스의 권한으로 실행하고 싶은 어셈블리어들을 실행하는 것이다. 때문에 프로세스의 실행을 조작해야 하는데 그 프로세스의 실행 흐름의 실체는 `rip` 레지스터의(**PC**) 값이 가르키고 있는 명령어이다. 그리고 `rip` 를 바꿀 수 있는 방법 중 하나가 `ret` 명령어를 악용하는 것이다. 

- `ret` : 스택 맨 위(`rsp`)에 있는 값을 `pop` 해서 `rip` 레지스터에 덮어쓴다. 

  - `call` 명령어가 스택에 저장해놓은 **리턴 주소값**을 `pop` 해서 `rip` 레지스터에 덮어쓴다. 프로그램의 실행 흐름을 부모 함수의 실행 흐름으로 되돌리는 것이다. 

  - 해커는 해당 프로세스의 권한으로 자신이 원하는 동작을 행동하기 위해서 `rip` 를 바꾸기를 원한다. 때문에 `call` 명령어가 스택에 저장해두었던 **리턴 주소값** 을 해커가 실행하길 원하는 명령어가 있는 주소값으로 덮어쓴다.
  
    - ~~컴퓨터는 단지 표지판이 가르키는대로 이동하고 실행하고 이동하고 실행하기 때문에 **리턴 주소값** 을 해커가 조작했다 하더라도 컴퓨터는 단순히 그 주소값으로 이동하고 실행하기를 계속한다.~~

# 함수 인자와 반환값 전달 원리 

`64` 비트 시스템과  `32` 비트 시스템에서의 함수 인자 전달 방식이 약간 다르기 때문에 `file` 명령어 등을 통해서 디버깅을 할 때 `64` 비트용 프로그램인지 `32` 비트용 프로그램인지 확인해야 한다. 

- `32` 비트 프로그램의 출력:

  ```shell
  $ file crackme0x00a
  crackme0x00a: ELF 32-bit LSB executable, Intel 80386, ...
  ```
  
- `64` 비트 프로그램의 출력: 

  ```shell
  $ file test64
  test64: ELF 64-bit LSB shared object, x86-64, ...
  ```


## 64 비트 시스템의 함수 인자/리턴값 전달

- 함수 리턴값 전달 : 함수의 반환값은 `rax` 레지스터에 저장되어 반환된다.

- 함수 인자 전달 : 함수 인자가 첫번째 인자부터 차례대로 `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9` 에 저장되어 전달된다. 

  - 인자가 `7` 개 이상일 경우 `7` 번째 인자부터는 어쩔 수 없이 레지스터보다 좀 더 느린 RAM 을  사용한다.

  - [many-add.c](many-add.c) 를 보자. 이 경우 `rdi` &larr; `1`, `rsi` &larr; `2`, `rdx` &larr; `3`, `rcx` &larr; `4`, `r8` &larr; `5`, `r9` &larr; `6` 이 저장되서 전달되고 `7` 은 메모리에 저장된 채로 `many_add` 함수로 인자가 전달될 것 같다. 정말 그렇게 되는지 확인해보자. 
  

    ```c
    #include <stdio.h>
    int many_add(int n1, int n2, int n3, int n4, int n5, int n6, int n7) {
        int result = n1 + n2 + n3 + n4 + n5 + n6 + n7;
        return result;
    }
    void main() {
        int result = many_add(1, 2, 3, 4, 5, 6, 7);
        printf("%d\n", result);
    }
    ```
  
    - `gcc many-add.c -o many-add` 로 컴파일후 `main` 함수를 해부해보자. 

      ```shell
      $ objdump -M intel -D many-add | grep \<main\>: -A21
      0000000000400567 <main>:
        ...
        40056f:	6a 07                	push   0x7
        400571:	41 b9 06 00 00 00    	mov    r9d,0x6
        400577:	41 b8 05 00 00 00    	mov    r8d,0x5
        40057d:	b9 04 00 00 00       	mov    ecx,0x4
        400582:	ba 03 00 00 00       	mov    edx,0x3
        400587:	be 02 00 00 00       	mov    esi,0x2
        40058c:	bf 01 00 00 00       	mov    edi,0x1
        400591:	e8 90 ff ff ff       	call   400526 <many_add>
        400596:	48 83 c4 08          	add    rsp,0x8
        ...
        4005a0:	89 c6                	mov    esi,eax
        4005a2:	bf 44 06 40 00       	mov    edi,0x400644
        4005ac:	e8 4f fe ff ff       	call   400400 <printf@plt>
        ...
      ```
  
    - `0x400591` 의 `call many_add` 가 실행되기 전에 함수 인자가 차례로 저장되고 있다.
  
    - 인자를 초기화한 후 `call` 은 다음 명령어의 주소값(`0x400596`)를 스택에 `push`하고 `add` 함수를 실행한다.
    
    - `add` 함수가 끝나면 `ret` 명령어가 `call` 이 스택에 저장해놓은 리턴 주소값(`0x400596`)을 `pop` 해서 `rip` 에 덮어쓴다. 

## 32 비트 시스템의 함수 인자/리턴값 전달

- 함수 리턴값 전달 : 함수의 반환값은 `eax` 레지스터에 저장되어 반환된다.

- 함수 인자 전달 : 인자를 차례대로 `esp, esp+4, esp+8, ..., esp+4n` 의 위치에 저장한 후 `call` 명령어로 함수를 호출한다. 

  - [many-add.c](many-add.c) 를 다시 보자. `32` 비트 시스템에서는 그냥 모든 인자들이 스택에 저장되어 `many_add` 함수로 인자가 전달될 것 같다. 정말 그렇게 되는지 확인해보자. 
  
    - `gcc many-add.c -o many-add -m32` 로 컴파일후 `main` 함수를 해부해보자. `-m32` 옵션을 붙혀야 `32` 비트 시스템용 프로그램이 된다. 

      ```shell
      $ objdump -M intel -D many-add | grep \<main\>: -A21
      0804843a <main>:
      ...
      804844b:	6a 07                	push   0x7
      804844d:	6a 06                	push   0x6
      804844f:	6a 05                	push   0x5
      8048451:	6a 04                	push   0x4
      8048453:	6a 03                	push   0x3
      8048455:	6a 02                	push   0x2
      8048457:	6a 01                	push   0x1
      8048459:	e8 ad ff ff ff       	call   804840b <many_add>
      804845e:	83 c4 1c             	add    esp,0x1c
      8048461:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
      8048464:	83 ec 08             	sub    esp,0x8
      8048467:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
      804846a:	68 00 85 04 08       	push   0x8048500
      804846f:	e8 6c fe ff ff       	call   80482e0 <printf@plt>
        ...
      ```
  
    - `0x8048459` 의 `call many_add` 가 실행되기 전에 함수 인자가 차례로 스택에 저장되고 있다.
  
    - 인자를 초기화한 후 `call` 은 다음 명령어의 주소값(`0x804845e`)를 스택에 `push`하고 `add` 함수를 실행한다.
    
    - `add` 함수가 끝나면 `ret` 명령어가 `call` 이 스택에 저장해놓은 리턴 주소값(`0x804845e`)을 `pop` 해서 `rip` 에 덮어쓴다. 

---

## 과제 

### 과제 가이드 

1. [HW-3.md](HW-3/readme.md) 파일의 지시를 따르는 것이 과제이다. (발표를 하며 설명을 할 수 있어야 합니다)

2. 과제 파일은 [HW-3](HW-3) 디렉토리에 만들어야 한다. 

3. 과제 파일이 완성되면 다음 명령어를 참고하여 완성된 과제를 푸쉬한다. 

```shell
cd /path/to/security
git add .
git commit -m "complete HW-3"
git push -u origin master
```

4. 마지막으로 `pull requests` 를 한다. 
