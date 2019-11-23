# bomb write-up

일단 r2 로 bomb 을 정적 분석해보자. main 함수를 분석해보면 단순히 입력 값이 1 또는 yellow 일 때 yellow 함수로 보내주고 2 또는 green 일 때 green 함수로 보내주고 3 또는 blue 일 때 blue 함수로 보내주며 4 또는 red 일 때 red 함수로 보내준다. 또 exit 또는 quit 을 입력하면 단순히 프로그램을 종료한다. 

## yellow 함수 

1. `s sym.yellow` 로 yello 함수를 찾고 `pdf` 명령으로 함수의 어셈블리어를 분석해보자. 분석해보면 입력받은 값을 아스키코드 0x38, 0x34, 0x33, 0x37, 0x31, 0x30, 0x36, 0x35 와 비교한다. 이것을 문장으로 나타내면 "84371065" 이다. 만약 이 값이 입력되면 0x804c124 주소를 0 으로 초기화 하는데 이곳은 `<wire_yello>` 섹션이다. 

2. `objdump -D bomb | grep wire -A2` 명령어로 나머지 wire 도 있는지 확인해보니 wire_yello, wire_red, wire_green, wire_blue 섹션이 각각 01 00 의 값으로 초기화되어 있었다. 그러므로 폭탄은 이 wire 섹션들이 모두 0 으로 바뀌었을 때 해체된다고 유추할 수 있다. 

## green 함수 

**BOF(Buffer Overflow)** 할 줄 알아야 함. 패스.

## red 함수

### 초기화

- red_preflight 함수 호출

- [var_4h] = str.ABCDEFGHJKLMNPQRSTUVWXYZ23456789 

- [var_8h] = 0

- 0x80498ba 로 점프

#### red_preflight 함수

- [obj.r] - (0x804c264) = 0x6b8b4567

- [obj.r + 4] - (0x804c268) = 0x6b8b4567

- [obj.r + 8] - (0x804c26c) = 0x6b8b4567

- [obj.buffer] = (0x15 길이의 입력한 문자열)

### dl, al 비교 

0x0804984c      8b45f8         mov eax, dword [var_8h]
0x0804984f      0fb6904cc204.  movzx edx, byte [eax + obj.buffer] ; [0x804c24c:1]=0
0x08049856      a16cc20408     mov eax, dword [0x804c26c]  ; [0x804c26c:4]=0
0x0804985b      83e01f         and eax, 0x1f
0x0804985e      0345fc         add eax, dword [var_4h]
0x08049861      0fb600         movzx eax, byte [eax]
0x08049864      38c2           cmp dl, al
0x08049866      740f           je 0x8049877

### wire_red 를 0 으로 만드는 조건

먼저 red 함수에서 wire_red 를 0 로 만드는 코드는 다음과 같다. 만약 jle 가 실행된다면 0x804984c 로 점프하기 때문에 빨간선이 해제되지 않는다. 따라서 [var_8h] 는 0x12 보다 커야 한다. 0x12 는 상수이기 때문에 조사할 것이 없고 [var_8h] 를 결정하는 요소를 찾자. 

    ```assembly
    0x080498ba      837df812       cmp dword [var_8h], 0x12  
    0x080498be      7e8c           jle 0x804984c             
    0x080498c0      c70528c10408.  mov dword obj.wire_red, 0 
    ```

---

### [var_8h] 를 결정하는 요소 

[var_8h] 는 다음 두 코드가 결정한다. 

  - 이 코드에서 [var_8h] 이 초기화되고 다시는 실행되지 않는다. [var_8h] 이 처음에는 0 이라는 정보 외에는 얻을 것이 없으니 더 이상 조사할 필요 없다. 

    ```assembly
    0x08049843      c745f8000000.  mov dword [var_8h], 0
    ```

  - 이 코드에서 [var_8h] 에 1 을 더한다. 그런데 이 코드는 어떤 분기에 의해 실행이 결정된다. 이제 그 분기 조건을 역추적해야 한다. 또한 그 분기가 0x12 번 이상 실행되면 빨간선이 해제된다는 것을 직관적으로 이해할 수 있다. 

    ```assembly
    0x080498b6      8345f801       add dword [var_8h], 1
    ```

---

### [var_8h] 에 1 을 더하는 분기 조건 

[var_8h] 에 1 을 더하는 분기 조건은 다음의 코드와 같다. 이 코드는 cmp 문으로 dl 과 al 을 비교하여 같으면 [var_8h] 에 1 을 더하는 분기로 점프한다. 따라서 dl 과 al 은 같아야 한다. 그럼 이제 dl 과 al 을 결정하는 요소를 조사하자. 

   ```assembly
   0x0804984c      8b45f8         mov eax, dword [var_8h]
   0x0804984f      0fb6904cc204.  movzx edx, byte [eax + obj.buffer] ; [0x804c24c:1]=0
   0x08049856      a16cc20408     mov eax, dword [0x804c26c]  ; [0x804c26c:4]=0
   0x0804985b      83e01f         and eax, 0x1f
   0x0804985e      0345fc         add eax, dword [var_4h]
   0x08049861      0fb600         movzx eax, byte [eax]
   0x08049864      38c2           cmp dl, al
   0x08049866      740f           je 0x8049877
   ```

#### al 을 결정하는 조건 

   ```assembly
   0x08049856      a16cc20408     mov eax, dword [0x804c26c]  ; [0x804c26c:4]=0
   0x0804985b      83e01f         and eax, 0x1f
   0x0804985e      0345fc         add eax, dword [var_4h]
   0x08049861      0fb600         movzx eax, byte [eax]
   ```

위의 코드에서 확인할 수 있듯이 al 을 결정하는 요소는 [0x804c26c] 과 [var_4h] 이다. [var_4h] 는 "ABCDEFGHJKLMNPQRSTUVWXYZ23456789" 이라는 문자열의 주소로 초기화되고 바뀌지 않는다. 이제 [0x804c26c] 를 결정하는 조건을 조사해야 한다. 

##### [0x804c26c] 를 결정하는 조건 

[0x804c26c] 는 다음 두 코드에서 결정된다. 

이 코드는 red_preflight 함수의 코드이다. rand 함수를 통해 랜덤값을 받다. 그런데 srand 함수로 시드값을 지정해주지 않아서 값은 항상 0x643c9869 로 초기화된다.

  ```assembly
  0x080497c3      e8fcefffff     call sym.imp.rand           ; int rand(void)
  0x080497c8      a36cc20408     mov dword [0x804c26c], eax  ; [0x804c26c:4]=0
  ```

이 코드는 red 함수의 코드이다. 결론적으로 eax 와 edx 의 OR 연산 결과값을 [0x804c26c] 에 저장하고 있기 때문에 eax 와 edx 를 결정하는 요소를 역추적해보자. 

  ```assembly
  0x08049889      09d0           or eax, edx
  0x0804988b      a36cc20408     mov dword [0x804c26c], eax  ; [0x804c26c:4]=0
  ```

###### eax 와 edx 를 결정하는 코드

eax 를 결정하는 코드 : red_preflight 함수에서 rand 함수의 결과값인 0x327b23c6 이 저장된다. 이것은 상수이므로 더 이상 조사할 필요 없다.

  ```assembly
  0x08049881      a168c20408     mov eax, dword [0x804c268]  ; [0x804c268:4]=0
  0x08049886      c1e01b         shl eax, 0x1b
  ```

edx 를 결정하는 코드 : edx 를 [0x804c26c] 가 결정하고 있는데 이 값은 위에서 조사했듯이 0x643c9869 이다.  이것도 상수이므로 더 이상 조사할 필요 없다.

  ```assembly
  0x08049877      a16cc20408     mov eax, dword [0x804c26c]  ; [0x804c26c:4]=0
  0x0804987c      89c2           mov edx, eax
  0x0804987e      c1ea05         shr edx, 5
  ```

#### dl 을 결정하는 조건

   ```assembly
   0x0804984c      8b45f8         mov eax, dword [var_8h]
   0x0804984f      0fb6904cc204.  movzx edx, byte [eax + obj.buffer] ; [0x804c24c:1]=0
   ```

위의 코드에서 확인할 수 있듯이 dl 을 결정하는 요소는 [var_8h] 과 [obj.buffer] 이다. [var_8h] 는 0 으로 초기값이 정해진다는 것을 이미 알고 있으니 [obj.buffer] 만 조사하면 된다. 그런데 [obj.buffer] 는 입력값이다. 

---

### 중간정리 

지금까지 조사한 결과를 복기해보면 wire_red 를 0 으로 만들기 위해 [var_8h] 를 0x12 보다 크게 만들어야 한다. 그런데 [var_8h] 의 초기값은 0 이고 1 을 더하는 조건이 dl 과 al 이 같게 되는 것이다. 그러므로 이 조건이 0x12 번 이상 만족되어야 빨간선이 해제된다는 것을 이해할 수 있다. 

al 을 결정하는 조건은 [0x804c26c] (실제값 0x643c9869) 와 [var_4h] (실제값 ABCD... 문자열의 주소)였고 이 둘은 상수였다. dl 은 [var_8h] (실제값 0 부터 1씩커짐) 와 [obj.buffer] 가 결정하는데 [var_8h] 은 상수고 [obj.buffer] 가 변수로써 입력한 값이다. 

---

## blue 함수

- wire_blue 를 0 으로 만드는 코드는 다음과 같다. 이 코드는 어떤 분기에 의해 실행되기 때문에 그 분기의 조건을 역추적하자. 

    ```assembly
    0x08049add      a140c10408     mov eax, dword obj.wire_blue ; [0x804c140:4]=1
    0x08049ae2      83e801         sub eax, 1
    0x08049ae5      a340c10408     mov dword obj.wire_blue, eax ; [0x804c140:4]=1
    ```

  - 다음 코드의 jne 가 실행되지 않아야 1 번의 코드가 실행되서 파란선이 해제된다. 즉 cmp 명령어로 obj.solution 과 [var_8h] 를 비교하고 있는데 이 둘이 같아야만 파란선이 해제되는 루틴으로 넘어간다는 것이다. 그런데 obj.solution 은 `blue` 함수에서 0x40475194 의 값을 갖는 상수이다. 상수는 입력한 값과 관계없이 불변하기 때문에 더 이상 조사할 것이 없다. 그러니 이제 [var_8h] 를 결정하는 요소를 역추적해보자. 

    ```assembly
    0x08049ac7      a184a30408     mov eax, dword obj.solution ; [0x804a384:4]=0x40475194
    0x08049acc      3945f8         cmp dword [var_8h], eax
    0x08049acf      751b           jne 0x8049aec
    ```

  - [var_8h] 을 결정하는 코드 조사해보면 다음의 두 코드에서 [var_8h] 를 수정하고 있다는 것을 알 수 있다. 

     - 

        ```assembly
        0x08049a77      8b45fc         mov eax, dword [var_4h]
        0x08049a7a      8b4004         mov eax, dword [eax + 4]    ; [0x4:4]=-1 ; 4
        0x08049a7d      3145f8         xor dword [var_8h], eax
        ```

     - 

        ```assembly
        0x080499fc      c745fc60c104.  mov dword [var_4h], obj.graph ; 0x804c160
        0x08049a03      8b45fc         mov eax, dword [var_4h]
        0x08049a06      8b4004         mov eax, dword [eax + 4]    ; [0x4:4]=-1 ; 4
        0x08049a09      8945f8         mov dword [var_8h], eax
        ```

---

# crackme write-up

- **0x04**

  1. `scanf` 의 파라미터가 ("%s", 0xffffd4c0) 임.

  2. `check` 라는 함수를 부르는데 파라미터가 (0xffffd4c0, 0xffffd4c0, 0xf7fcf410, 0x1) 임. `si` 로 `test` 함수로 들어감

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

- **0x05**

  1. `scanf` 가 ("%s", 0xffffd4c0) 로 호출된다. 

  2. `check` 함수 내부에서 또 다시 `sscanf` 가 ('입력받은 문자열의 첫번째 문자', '%d', 0xffffd494) 로 호출된다. 

  3. [ebp - 8] 과 0x10 을 비교하는데 마찬가지로 입력받은 첫번째 문자는 0 부터 9 까지의 범위이기에 0x10 과 같아지는 것이 불가능하다. 그러므로 루프를 한 번 더 돌아본다. 

     - `x/x $ebp - 8` : 메모리 값 확인 

  4. 마찬가지로 이전에 있던 문자를 더해서 0x10 과 비교한다. 하지만 `parell` 이라는 함수를 한 번 더 거쳐간다. 

     - `parell` 함수 내부에서 첫번째 문자와 두번째 문자로 숫자를 만들어서 AND 연산을 한 후 0 이 되었는지 확인해서 0 이 아니면 "Incorrect" 로직으로 흘러갔다. 
