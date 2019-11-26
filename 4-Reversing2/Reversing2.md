# 리버싱 (2)

## 헷갈리는 어셈블리어 정리

### test 명령어

`test <op1> <op2>`

`test` 명령어는 `<op1>` 과 `<op2>` 의 AND 연산 결과가 0 일 때 FLAG 레지스터의 Zero Flag, 즉 ZF 를 True 로 세팅한다. 그리고 `je` 명령어는 ZF 가 True 로 세팅되어 있을 때 점프한다. 그래서 `je` 명령어는 jump-if-zero 와도 같은 말이다. 

`cmp` 명령어는 두 값을 비교한다고 이해했는데 실제로는 `cmp <op1> <op2>` 는 <op1> 에서 <op2> 를 빼서 결과값이 0 이면 FLAG 레지스터의 ZF 를 True 로 세팅한다. 그래서 이후에 `je` 명령어가 FLAG 레지스터의 ZF 플래그가 True 로 세팅되어 있으면 점프하게 되고 세팅되어 있지 않으면 점프하지 않는다.

반대로 `jne` 을 jump-if-not-zero 와도 같다고 이해하면 된다. 

```assembly
test eax, eax
je <locatoin>
```

그래서 위와 같은 어셈블리어가 있을 때 eax 가 0 이 아니라면 eax 와 eax 의 AND 연산 결과는  0 이 아니다. 따라서 FLAG 레지스터의 ZF 플래그가 세팅되지 않을 것이고 `je` 는 점프하지 않는다. 한 마디로 eax 가 0 일 때 점프하라는 의미이다. 

### sete 명령어

`sete <reg>`

sete 명령어는 ZF (Zero Flag) 가 세팅되어 있다면 `<reg>` 를 1 로 만들고 그렇지 않으면 0 으로 만든다. 

## gdb (2)

### pwndbg 전용 명령어 

`set context-output <tty>` : context 를 다른 tty 로 리다이렉트 함. 이때 tmux 가 함께 사용되어야 함. 아래의 경우 `tty` 로 터미널의 이름을 확인해보니 `/dev/pts/5` 이기 때문에 `set context-output /dev/pts/5` 라고 입력하면 context 가 리다이렉트 된다. 

  ```shell
  $ tty 
  /dev/pts/5
  ```

`nextcall` : 다음 `call` 까지 진행. 

`nextjmp` : 다음 `jmp` 까지 진행.

`pdisas <function>` : 함수의 어셈블리어를 이쁘게 보여줌 

### 내가 추가한 pwndbg 명령어 (pwndbg 개발자한테 pull requests 예정)

`set context-stack-reverse on` or `off` : context 의 stack 섹션을 거꾸로 볼 수 있음. 즉 rbp 가 위에 있고 rsp 가 아래에 있도록 볼 수 있음. 

`set context-output-regs <tty>` : context 의 regs 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

`set context-output-stack <tty>` : context 의 stack 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

`set context-output-backtrace <tty>` : context 의 backtrace 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

`set context-output-code <tty>` : context 의 code 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

`set context-output-disasm <tty>` : context 의 disasm 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

`set context-output-args <tty>` : context 의 args 섹션만 특정 tty 로 리다이렉트 할 수 있음. 

### 유용한 명령어

`disas <function>` : 함수의 어셈블리어를 보여줌 

`print <var or funct>` or `p <var or func>` : 변수 또는 함수의 정보를 볼 수 있음 

`watch <location>` : 해당 메모리가 변하는 것을 볼 수 있음. pwndbg 의 경우 context 가 watch 의 출력을 씹어버려서 context 를 다른 tty 로 리다이렉트 해주어야 함. 

  - `watch *0x80808080` : 0x80808080 의 주소값의 값이 변하는 것을 관찰한다 

  - `info watchpoint` or `i wat` : 와치포인트 리스트를 본다. 

  - `delete watchpoint <num>` or `d wat <num>` : 와치포인트를 삭제한다.

`backtrace` or `bt` : 호출 함수 스택을 볼 수 있음 

`info register` or `i r` : 레지스터 정보

`finish` : 자신을 호출한 함수로 리턴할 때까지 실행 

`r <args>` : gdb 안에서 프로그램을 실행할 때 `<args>` 를 main 함수의 인자로 전달함

`r <<< $(command)` : gdb 안에서 프로그램에 `command` 의 결과를 입력으로 전달함 

  - `command | ./program` : 과 같은 효과임.

  - `r <args>` 와 다른 점은 `r <args>` 는 `./program <args>` 와 같은 효과라는 것임. 

### 메모리 보기 

`x/x $esp` : esp 주소값에 있는 값을 하나 본다. 

`x/x $ebp` : ebp 주소값에 있는 값을 하나 본다. 

`x/x 0x80808080` : 0x80808080 메모리에 있는 값을 하나 본다. 

`x/b 0x80808080` : byte 형식으로 보기 

`x/wx 0x80808080` : double-word 형식으로 보기 

`x/10x 0x80808080` : 0x80808080 메모리에 있는 값을 10 개 본다. 

`x/c 0x80808080` : 0x80808080 메모리에 있는 값을 char 형식으로 본다. 

`x/s 0x80808080` : 0x80808080 메모리에 있는 값을 string 형식으로 본다. 

`x/i 0x80808080` : 0x80808080 메모리에 있는 값을 instruction 형식으로(어셈블리어) 로 본다. 

### 메모리 쓰기

`set $esp = 0x4444` : esp 레지스터의 값을 0x4444 로 쓴다. 

`set $rip = 0x80808080` : rip 레지스터의 값을 0x80808080 으로 쓴다. 다음에 실행할 명령어를 바꾸는 의미. 

`set *0xffffce00 = 0` : 0xffffce00 메모리 주소에 있는 값을 0 으로 바꾼다. 

`set *0xffffce00 = 0x41414141` : 0xffffce00 메모리 주소에 있는 값을 0x41414141 으로 바꾼다. 

## radare2 사용법

`gdb` 로 동적 분석을 편하게 할 수 있다면 `radare2` 로 정적 분석을 편하게 할 수 있음. 동적 분석이란 프로그램을 실행 중에 분석하는 것이고 정적 분석이란 프로그램을 실행하지 않고 분석하는 것. 

- https://moveax.me/radare-basics/

  - 전부 다 

- https://github.com/Maijin/Workshop2015/blob/master/slides.pdf

  - rabin2 

  - rafind2 

- https://radare.gitbooks.io/radare2book/content/ 
  
  - 레퍼런스 

## main 함수를 인자로 받는 어셈블리 프로그램 설명 

[arguments.asm](arguments.asm)

## crackme0x00a ~ crackme0x03 까지 설명

- 리버싱 원칙 

  1. "Correct" 가 출력되는 로직과 "Incorrect" 가 출력되는 로직의 분기점을 확인한다.

     - 좀 더 일반적으로 말하면 게임 월핵을 만들고 싶다고 가정하면 게임 속 벽이 캐릭터를 가리는 로직의 분기점을 확인하는 것. 

  2. 분기가 어떻게 결정되는지 확인한다. 분기가 어떻게 결정되는지 이해하면 분기를 조작할 수 있다(==해킹할 수 있다). 

- **0x00a** : 설명할 필요가 없음 

- **0x00b** 

  1. scanf 가 `%ls` 의 형식으로 입력을 받음. `%ls` 에 대해서 검색해보니 와이드 스트링을 받는 용도로 `%s` 와는 구별이 됨. 

  2. 또한 비밀번호를 비교할 때 wcscmp 함수를 사용.
  
  3. wcscmp 함수에 대하여 알아보니 와이드 캐릭터에 대한 비교 함수임.
  
  4. 그래서 와이드 캐릭터를 알아보니 일반적인 8 비트 캐릭터가 아닌 유니코드 같은 16 비트 캐릭터를 저장하기 위한 캐릭터. 

- **0x01**

  1. `scanf` 의 파라미터가 ("%d", 0xffffd543) 임.

  2. `cmp` 로 `[ebp - 4]` 를 0x149a 와 비교함. 그리고 같이 않으면 "Incorrect" 를 출력하는 로직으로 흘러감. 

     - `p $ebp - 4` 로 $ebp - 4 의 주소값을 확인해보니 0xffffd543 임. 

  3. 그래서 입력한 값이 0x149a, 즉 5274 이면 `cmp` 문이 같다는 결과를 FLAG 레지스터에 씀.  

- **0x02**

  1. `scanf` 의 파라미터가 ("%d", 0xffffd534) 이고 0xffffd534 는 ebp - 4 임.

  2. ebp - 4 주소값에 있는 값을 eax 에 저장하고 이 값을 ebp - 0xc 주소값에 있는 값과 비교함. 

  3. 그런데 ebp - 0xc 에는 0x52b24 가 저장되어 있음.

     - `p $ebp - 0xc` 로 주소값 확인

     - `x/x $ebp - 0xc` 로 메모리값 확인 

- **0x03**

  1. `scanf` 의 파라미터가 ("%d", 0xffffd534) 이고 0xffffd534 는 ebp - 4 임.

  2. `test` 라는 함수의 파라미터가 ("입력한 값", 0x52b24, 0xf7ffd000, 0xf7e166a5) 임. `si` 로 `test` 함수로 들어감

  3. `test` 함수에서 입력한 값과 0x52b24 (338724) 를 비교함. 같지 않으면 "Invalid" 를 출력하는 로직으로 흘러감. 

---

## 과제 

### 과제 가이드 

1. [HW-4.md](HW-4/HW-4.md) 파일의 지시를 따르는 것이 과제이다. (발표를 하며 설명을 할 수 있어야 합니다)

2. 과제 파일은 (HW-4) 디렉토리에 만들어야 한다. 

3. 과제 파일이 완성되면 다음 명령어를 참고하여 완성된 과제를 푸쉬한다. 

```shell
cd /path/to/security
git add .
git commit -m "complete HW-4"
git push -u origin master
```

4. 마지막으로 `pull requests` 를 한다. 
