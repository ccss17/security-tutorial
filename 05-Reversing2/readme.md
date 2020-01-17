# 리버싱 (2)

## crackme0x04 ~ crackme0x05 까지 설명

### **crackme0x04** 

1. `scanf` 의 파라미터가 ("%s", 0xffffd4c0) 임.

2. `check` 라는 함수를 부르는데 파라미터가 (0xffffd4c0, 0xffffd4c0, 0xf7fcf410, 0x1) 임. `si` 명령어로 `test` 함수로 들어감

3. `strlen` 함수를 0xffffd4c0 를 대상으로 호출하고 반환값을 [ebp - 0xc] 와 비교함.

    - 0xffffd4c0 는 입력한 문자열임.

    - [ebp - 0xc] 는 0 임. 

4. 만약 0 이 0xffffd4c0 에 저장된 문자열의 길이보다 같거나 크면 `jae` 가 실행됨.

5. 여기서부터 `check` 함수에 대한 정적분석이 `gdb` 만으로는 한계가 있어서 `radare2` 로 정적분석을 함. 

6. `check` 함수에서 `sscanf` 함수를 호출하는데 파라미터가 ("입력한 문자열의 첫번째 문자", "%d", 0xffffd494) 임. 

    - `sscanf` 함수는 첫번째 파라미터의 문자열을 입력으로 하는 `scanf` 와 동일했음. `scanf` 가 입력을 키보드로부터 받는다면 `sscanf` 는 입력을 첫번째 파라미터로 받음. 

    - `%d` 포맷 스트링으로 입력을 받기 때문에 정수형이 아닌 데이터가 전달되면 입력이 무시됨. 

7. 입력받은 문자열의 첫번째 문자를 0xf 과 비교함. 그런데 정수형으로만 입력을 받기 때문에 0 부터 9 까지의 입력으로는 0xf 와 같게 만드는 것은 불가능하다. 

8. 그런데 루프를 한 번 더 돌아보니까 두번째 문자를 첫번째 문자와 더해주더라. 그러고나서 0xf 와 비교하더라. 

### **crackme0x05** 

1. `scanf` 가 ("%s", 0xffffd4c0) 로 호출된다. 

2. `check` 함수 내부에서 또 다시 `sscanf` 가 ('입력받은 문자열의 첫번째 문자', '%d', 0xffffd494) 로 호출된다. 

3. [ebp - 8] 과 0x10 을 비교하는데 마찬가지로 입력받은 첫번째 문자는 0 부터 9 까지의 범위이기에 0x10 과 같아지는 것이 불가능하다. 그러므로 루프를 한 번 더 돌아본다. 

    - `x/x $ebp - 8` : 메모리 값 확인 

4. 마찬가지로 이전에 있던 문자를 더해서 0x10 과 비교한다. 하지만 `parell` 이라는 함수를 한 번 더 거쳐간다. 

    - `parell` 함수 내부에서 첫번째 문자와 두번째 문자로 숫자를 만들어서 AND 연산을 한 후 0 이 되었는지 확인해서 0 이 아니면 "Incorrect" 로직으로 흘러갔다. 

### 더 많은 write-up 

- [https://moveax.me/crackme0x04/](https://moveax.me/crackme0x04/)

- [https://moveax.me/crackme0x05/](https://moveax.me/crackme0x05/)

- [27기 hayeong 님](hayeong.md)

- [27기 pyojunCode 님](pyojunCode.md)

## radare2 사용법

`gdb` 로 동적 분석을 편하게 할 수 있다면 `radare2` 로 정적 분석을 편하게 할 수 있다. 동적 분석이란 프로그램을 실행 중에 분석하는 것이고 정적 분석이란 프로그램을 실행하지 않고 분석하는 것이다. 다음 튜토리얼을 따라하면서 `r2` 의 사용법을 익힌다. 

- https://moveax.me/radare-basics/

다음 링크는 `r2` 의 레퍼런스 격의 문서들이다. 명령어들을 참고하는 용도로 사용하면 된다. 

- https://radare.gitbooks.io/radare2book/content/ 

- https://github.com/Maijin/Workshop2015/blob/master/slides.pdf

### 기본 명령어 

- `afl` : 함수 검색 

- `s main` : `main` 으로 이동 

- `s sym.check` : `check` 으로 이동 

- `VV` : 그래프 

- `pdd` : 함수 디스어셈블. **r2dec-js** 플러그인 설치 시 슈도 코드 생성 

- TODO

## 간단한 암호화 복호화

### XOR 암호화

XOR 연산에는 같은 key 값으로 데이터에 두 번 연산할 경우 원래의 데이터로 돌아오는 특성이 있기 때문에 암호화에 사용된다. 

![XOR](https://electronicsarea.com/wp-content/uploads/xor-truth-table.gif)

XOR 은 위와 같이 두 입력 값이 같으면 0 이 출력되고 다르면 1 이 출력된다. 이제 A 를 원본 데이터라고 생각하고 B 를 XOR 키라고 생각하자. 

| 원본 데이터 | XOR 키 | 출력 | XOR 키 | 원본 데이터 |
|:----------:|:------:|:----:|:-----:|:----------:|
| 0          | 0      | 0    | 0     | 0          |
| 0          | 1      | 1    | 1     | 0          |
| 1          | 0      | 1    | 0     | 1          |
| 1          | 1      | 0    | 1     | 1          |

위의 표는 XOR 암호화의 진리표이고 XOR 출력에 XOR 키를 다시 적용하면 원본 데이터가 복원된다는 것의 증명이다. 

### XOR 연산 테스트

#### C 언어

C 언어에서 a 와 b 를 xor 연산 하고 싶을 때 `a ^ b` 라고 하면 XOR 연산 결과가 반환된다. 

```c
#include <stdio.h>

void print_binary(int n) {
    int e = 0, d;

    while((d = 1 << e++) <= n);
    printf("0b");
    while((d >>= 1) != 0)
        printf("%c", (n & d) ? '1' : '0');
    puts("");
}

void main(){
    printf("Binary of 31 : \t\t");
    print_binary(31);

    printf("Binary of 25 : \t\t");
    print_binary(25);

    printf("Binary of 31 ^ 25 : \t");
    print_binary(31 ^ 25);

    printf("Binary of 31 ^ 25 ^ 25 :");
    print_binary(31 ^ 25 ^ 25);
}
```

출력 결과를 보면 같을 때 0 이 되고 다를 때 1 이 되는 XOR 연산을 확인할 수 있다. 참고로 숫자 앞에 `0b` 가 있으면 이진법으로 표현하겠다는 뜻이다. `0x` 가 숫자 앞에 있으면 16 진수로 표현하겠다는 것이고 `0o` 가 앞에 있으면 8진수로 표현하겠다는 거여. 

```shell
Binary of 31 :          0b11111
Binary of 25 :          0b11001
Binary of 31 ^ 25 :     0b110
Binary of 31 ^ 25 ^ 25 :0b11111
```

#### Python 

C 언어에서도 XOR 연산을 테스트할 수 있지만 이렇게 Python 에서 하는 게 훨씬 쉽고 시간 절약이 된다. 

```python
print('Binary of 31 : \t\t', bin(31))
print('Binary of 25 : \t\t', bin(25))
print('Binary of 31 ^ 25 : \t', bin(31 ^ 25))
print('Binary of 31 ^ 25 ^ 25 :', bin(31 ^ 25 ^ 25))
```

### XOR 암호화 테스트

```c
#include <stdio.h>

void simple_string_xor(char * ptr, int key) {
    char * tmp = ptr;
    while (*tmp) *tmp++ ^= key;
}
```

위와 같은 함수를 사용해서 XOR 암호화, 복호화를 실험해보자. 

```c
int main(int argc, char * argv[]) {
    char data[] = "simple xor encrypt test";
    int key = 0x30;

    simple_string_xor(data, key);
    printf("XOR:%s\n", data);

    simple_string_xor(data, key);
    printf("XOR:%s\n", data);
    return 0;
}
```

위의 C 프로그램은 xor 암호화를 간단하게 실험할 수 있는 코드이다. 0x30 으로 XOR 암호화를 하고 있고 XOR 연산을 동일한 key 로 다시 적용하자 원본 데이터가 복원된다. 

```c
int main(int argc, char * argv[]) {
    char data[] = "simple xor encrypt test";
    int key[] = {0x30, 0x111, 0x18, 0x91};

    simple_string_xor(data, key[0]);
    simple_string_xor(data, key[1]);
    simple_string_xor(data, key[2]);
    simple_string_xor(data, key[3]);
    printf("XOR:%s\n", data);

    simple_string_xor(data, key[3]);
    simple_string_xor(data, key[2]);
    simple_string_xor(data, key[1]);
    simple_string_xor(data, key[0]);
    printf("XOR:%s\n", data);
    return 0;
}
```

위의 C 프로그램은 여러개의 XOR 키를 적용하여 XOR 암호화를 하고 복호화도 해본 실험이다. 데이터가 성공적으로 원본으로 되돌려진다. 그런데 다음의 코드처럼 암호화된 XOR 의 순서와 복호화된 XOR 순서를 바꿔줘도 아무런 문제 없이 원본 데이터가 복원된다. 

```c
int main(int argc, char * argv[]) {
    char data[] = "simple xor encrypt test";
    int key[] = {0x30, 0x111, 0x18, 0x91};

    simple_string_xor(data, key[2]);
    simple_string_xor(data, key[1]);
    simple_string_xor(data, key[3]);
    simple_string_xor(data, key[0]);
    printf("XOR:%s\n", data);

    simple_string_xor(data, key[3]);
    simple_string_xor(data, key[0]);
    simple_string_xor(data, key[1]);
    simple_string_xor(data, key[2]);
    printf("XOR:%s\n", data);
    return 0;
}
```

#### XOR 암호화 테스트 Python

이렇게 C 보다 훨씬 간단하게 Python 으로 XOR 암호화/복호화 테스트를 해볼 수 있다. 

```python
data = "simple xor encrypt test"
data_list = list(data)
keys = [0x30, 0x11, 0x18, 0x91]

for key in keys:
    for i, v in enumerate(data_list):
        data_list[i] = chr(ord(v) ^ key)
print('XOR:', ''.join(data_list))

for key in keys:
    for i, v in enumerate(data_list):
        data_list[i] = chr(ord(v) ^ key)
print('XOR:', ''.join(data_list))
```

출력결과

```shell
XOR: ÛÁÅØÄÍÐÇÚÍÆËÚÑØÜÜÍÛÜ
XOR: simple xor encrypt test
```

## 실전

지금까지 배우고 연습했던 컴퓨터 공학 지식 / 리버싱 도구 / 리버싱 테크닉을 활용해서 실제 리버싱 경쟁 사이트로 가서 리버싱 문제를 해결해봅시다. 

1. http://reversing.kr/ : 회원가입 및 로그인을 한다. 

2. 다음의 명령어를 참고해서 Easy ELF 리버싱 문제를 다운 받는다. PHPSESSID 에 대입되는 쿠키값은 각자 다르다. 

    - 크롬 쿠키값 확인 법 : https://dololak.tistory.com/581

```shell
curl http://reversing.kr/download.php\?n\=11  -o easyelf --cookie "PHPSESSID=0347e0d4kofpnmajka34qd1p10"
chmod +x easyelf
```

3. `easyelf` 를 스스로 리버싱하여 풀어봅시다. 

## easyelf write-up

1. main 함수 

    ```assembly
    0x0804854a      83f801         cmp eax, 1                  
    0x0804854d      750c           jne 0x804855b
    ```

  - 위 코드에서 eax 가 0 이면 "Wrong" 이 출력되는 루틴으로 가기 때문에 eax 가 1 이 되어야 한다고 유추할 수 있다. 그러니 이제 eax 를 결정하는 조건이 뭔지 역추적하자. 

2. 0x8048451 함수에서 eax 를 바꿀지 확신할 수 없지만 eax 를 바꾸지 않는다는 보장도 없기 때문에 분석을 한다. 

  - 0x080484f0      mov eax, 1 : 이 코드에서 eax 가 1 이 되고 ret 된다. 그런데 이 코드는 어떤 분기에 의해 결정된다. 그러니 이제 이 분기를 결정하는 조건을 역추적. 

  - 다음의 코드에서 je 가 실행되어야 eax 가 1 이 되는 코드로 점프하기 때문에 이 시점에서 al 은 0xdd 가 되어야 한다. 그런데 이 코드도 어떤 분기에 의해 결정되기에 그 분기를 결정하는 조건을 역추적하자. 

    ```assembly
    0x080484de      0fb60523a004.  movzx eax, byte [0x804a023] 
    0x080484e5      3cdd           cmp al, 0xdd
    0x080484e7      7407           je 0x80484f0
    ```

  - 다음의 코드에서 je 가 실행되어야 2 번의 코드로 점프한다. 그러니 이 시점에서 al 은 0x78 이 되어야 한다. 그런데 이 코드도 어떤 분기에 의해 결정되기에 그 분기를 결정하는 조건을 역추적하자. 

    ```assembly
    0x080484cc      0fb60520a004.  movzx eax, byte [0x804a020] ; [0x804a020:1]=0
    0x080484d3      3c78           cmp al, 0x78                ; 'x' ; 120
    0x080484d5      7407           je 0x80484de
    ```

  - 다음의 코드에서 je 가 실행되어야 3 번의 코드로 점프한다. 그러니 이 시점에서 al 은 0x7c 가 되어야 한다. 그런데 이 코드도 어떤 분기에 의해 결정되기에 그 분기를 결정하는 조건을 역추적하자. 

    ```assembly
    0x080484ba      0fb60522a004.  movzx eax, byte [0x804a022] ; [0x804a022:1]=0
    0x080484c1      3c7c           cmp al, 0x7c                ; '|' ; 124
    0x080484c3      7407           je 0x80484cc
    ```

  - 다음의 코드에서 je 가 실행되어야 4 번의 코드로 점프하기에 이 시점에서 al 은 0 이 되어야 한다. 그런데 이 코드도 어떤 분기에 의해 결정되기에 그 분기를 결정하는 조건을 역추적하자. 

    ```assembly
    0x080484a8      0fb60525a004.  movzx eax, byte [0x804a025] ; [0x804a025:1]=0
    0x080484af      84c0           test al, al
    0x080484b1      7407           je 0x80484ba
    ```

  - 다음의 코드에서 je 가 실행되어야 5 번의 코드로 점프하기에 이 시점에서 al 은 0x58 이 되어야 한다. 그런데 이 코드도 어떤 분기에 의해 결정되기에 그 분기를 결정하는 조건을 역추적하자. 

    ```assembly
    0x08048469      0fb60520a004.  movzx eax, byte [0x804a020] 
    0x08048470      83f034         xor eax, 0x34
    0x08048473      a220a00408     mov byte [0x804a020], al    
    0x08048478      0fb60522a004.  movzx eax, byte [0x804a022] 
    0x0804847f      83f032         xor eax, 0x32
    0x08048482      a222a00408     mov byte [0x804a022], al    
    0x08048487      0fb60523a004.  movzx eax, byte [0x804a023] 
    0x0804848e      83f088         xor eax, 0xffffff88
    0x08048491      a223a00408     mov byte [0x804a023], al    
    0x08048496      0fb60524a004.  movzx eax, byte [0x804a024] 
    0x0804849d      3c58           cmp al, 0x58                
    0x0804849f      7407           je 0x80484a8
    ```
   
  - 다음의 코드에서 je 가 실행되어야 6 번의 코드로 점프하기에 이 시점에서 al 은 0x31 이 되어야 한다. 그런데 이 코드는 0x8048451 함수가 실행되면 반드시 실행된다. 그리고 eax 를 초기화하는 0x804a021 의 주소값에는 입력한 문자열의 2번째 문자의 주소값이 들어가 있다. 
    
    ```assembly
    0x08048454      0fb60521a004.  movzx eax, byte [0x804a021] ; [0x804a021:1]=0
    0x0804845b      3c31           cmp al, 0x31                ; '1' ; 49
    0x0804845d      740a           je 0x8048469
    ```

  - 이제 입력한 값이 몇 가지 조건과 연산을 거쳐서 정답으로 이어지는 과정을 모두 역추적 했으니 필요한 최소한의 리버싱이 끝났다. 역추적 과정을 바탕으로 eax 를 1 이 되는 조건을 복기해보자. 

    ```assembly
    0x804a020 -> X -> X ^ 0x34 -> 0x78
    0x804a021 -> 0x31
    0x804a022 -> X -> X ^ 0x32 -> 0x7c
    0x804a023 -> X -> X ^ 0xffffff88 -> 0xdd
    0x804a024 -> 0x58
    0x804a025 -> 0x0
    ```
3. POC 코드 

    ```python
    c0 = 0x78 ^ 0x34        # 0x804a020
    c1 = 0x31               # 0x804a021
    c2 = 0x32 ^ 0x7c        # 0x804a022
    c3 = 0xdd ^ 0xffffff88  # 0x804a023
    c4 = 0x58               # 0x804a024
    c5 = 0x0                # 0x804a025
    
    key = [c0, c1, c2, c3, c4, c5]
    key = [ (l).to_bytes(4, byteorder='little') for l in key ]
    key = ''.join(chr(l[0]) for l in key)
    print(key)
    ```

  - 그러므로 위와 같은 파이썬 코드를 실행하면 정답을 출력한다. 이제 다음 명령어를 참고해서 문제를 해결하자. Python 2 가 아니라 Python 3 로 실행해야 한다. 

     ```shell
     python3 poc.py | ./easyelf
     ```

---

## 과제 

### 과제 가이드 

1. [HW-5.md](HW-5/HW-5.md) 파일의 지시를 따르는 것이 과제이다. (발표를 하며 설명을 할 수 있어야 합니다)

2. 과제 파일은 [HW-5](HW-5) 디렉토리에 만들어야 한다. 

3. 과제 파일이 완성되면 다음 명령어를 참고하여 완성된 과제를 푸쉬한다. 

```shell
cd /path/to/security
git add .
git commit -m "complete HW-5"
git push -u origin master
```

4. 마지막으로 `pull requests` 를 한다. 
