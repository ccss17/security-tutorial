# 컴퓨터를 밑바닥부터 이해해보자

## 컴퓨터에 대해 제대로 이해하면 이런 해킹도 할 수 있게 된다 

- https://www.youtube.com/watch?v=U7mWeKhd_-A

- https://www.youtube.com/watch?v=0L7DTMKekoU

---

# 컴퓨터의 원리 

[https://ko.wikipedia.org/wiki/괴델의*불완전성*정리](https://ko.wikipedia.org/wiki/괴델의_불완전성_정리)

[https://ropas.snu.ac.kr/~kwang/memo/turing1935.pdf](https://ropas.snu.ac.kr/~kwang/memo/turing1935.pdf)

[https://namu.wiki/w/불완전성%20정리](https://namu.wiki/w/불완전성%20정리)

[https://joone.net/2016/11/15/앨런-튜링과-폰노이만/](https://joone.net/2016/11/15/앨런-튜링과-폰노이만/)

[https://en.wikipedia.org/wiki/Computer](https://en.wikipedia.org/wiki/Computer)

[http://people.bu.edu/baws/brief%20computer%20history.html](http://people.bu.edu/baws/brief%20computer%20history.html)

[https://kama1204.tistory.com/entry/OS의-역사](https://kama1204.tistory.com/entry/OS의-역사)

> 지금부터하는 설명들은 위 출처의 내용을 적절히 다이제스트 한 것입니다. 

## 괴델의 불완전성 정리

1925년 다비트 힐베르트는 한 쪽 끝에 어떤 진술을 집어넣든지 간에, 일정한 추론규칙들이 부품이 되는 자동 장치(이것을 "알고리즘" 이라 함)을 만들어서 작동시키고 뒤로 물러앉아 있기만 하면 참/거짓이라는 증명이 계속해서 나오는 진리기계(형식화된 공식체계)를 구상했다.

즉 수학의 발전이라는 게 어차피 일정한 공리와 몇 가지 추론규칙으로 발전된 것 같으니까 그 추론규칙을 알고리즘으로 만들고 그 알고리즘을 작동시킬 수 있는 기계를 만들면 더 이상 고생할 필요없이 기계가 알아서 수학을 발전시켜주지 않겠냐는 것이다.

1931년 쿠르트 괴델은 불완전성 정리를 증명함으로써 이런 힐베르트의 프로그램이 존재할 수 없다는 것을 증명한다. 그 정리는 다음과 같고 [증명 과정은 이곳에](https://ko.wikipedia.org/wiki/%EA%B4%B4%EB%8D%B8%EC%9D%98_%EB%B6%88%EC%99%84%EC%A0%84%EC%84%B1_%EC%A0%95%EB%A6%AC#%EC%A6%9D%EB%AA%85) 있다. ([더 쉽고 친절한 증명 과정 설명](https://jinseob2kim.github.io/godel.html))

1. 어떤 공리 체계(논리 체계, 컴퓨터로 치면 프로그램)에 모순이 없다면 참이면서도 증명할 수 없는 명제가 하나 이상 존재한다.

2. 어떤 공리 체계에 모순이 없다면 그 공리 체계의 논리로는 자기 자신이 모순이 없다는 것을 증명할 수 없다.

논리에 맞지 않더라도 이해를 위하여 조금 더 쉽게 말해보자. 불완전성 첫번째 정리는 어떤 사람이 정상적인 사고활동을 하는 사람이라면 그 사람의 생각 중에는 증명할 수 없는 생각이 반드시 하나 이상 있다는 것이다. 만약 그 사람의 생각이 모두 증명될 수 있다면 그 사람의 사고 체계와 사상에는 반드시 모순이 존재한다. 불완전성 두번째 정리는 정신병자가 있는데 그 정신병자의 논리로는 자신이 정신병자가 아니라는 것을 증명할 수 없으며 정상인의 경우에도 그 사람의 논리로는 자신이 정상인임을 증명할 수 없다는 것이다. 

## 튜링 머신

- 원본 논문 : **[튜링, A.M. (1936). “계산가능수와 결정문제에 대한 응용에 관하여”.](https://londmathsoc.onlinelibrary.wiley.com/doi/epdf/10.1112/plms/s2-42.1.230)**

### 생각할 수 있는 모든 기계를 4 가지 부품으로 설계하기  

1935년 앨런 튜링은 케임브리지 대학 수학과에서 막스 뉴만 교수의 괴델의 불완전성 정리에 대한 강의를 듣고 1936년 발표한 논문을 통해 자신만의 방식으로 불완전성 정리를 다시 증명해 낸다. 튜링이 다시 증명하고 싶었던 불완전성 정리의 요지는 "자동으로는 수학의 모든 사실을 만들 수 없다" 는 것이었다는 것을 기억하자. 이 논문에서 튜링은 "자동으로는" 이 불가능하다는 것을 증명하기 위해 4 가지 부품으로 이루어진 '자동 기계장치' 를 정의하고 이렇게 정의하면 모든 기계를 충분히 표현할 수 있다고 설득한다.

### 4 가지 부품으로 설계된 기계를 문자로 표현하기 

그러므로 이제 튜링이 4 가지 부품을 활용하면 상상할 수 있는 어떤 기계라도 모두 다 만들 수 있다는 것을 증명했다고 생각하자. 그리고 튜링은 이 4 가지 부품을 일정한 형식으로 표현함으로써 그 어떤 기계일지라도 글로 표현 할 수 있다는 것을 보였다. 다시 말하면 세상 사람들이 구상한 그 어떤 기계일지라도 튜링이 정의한 일정한 형식을 통해 글로 표현될 수 있다는 것이다.

![튜링 기계](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile9.uf.tistory.com%2Fimage%2F212A774858DDFD432E3E31)

- 튜링이 말한 어떠한 기계도 표현할 수 있는 4 가지 부품

  1. 기호를 표시할 수 있는 무한히 긴 테이프

  2. 테이프를 읽고 쓸 수 있는 입출력 장치

  3. 현재의 상태를 표시할 수 있는 장치

  4. 규칙표

- 위와 같은 규칙표에 따르면 튜링 기계는 다음과 같이 작동한다

  1. 현 상태가 A 이고 읽은 기호가 _ 이기 때문에 _ 를 쓰고 오른쪽 칸으로 이동하고 상태 A 가 된다.

  2. 현 상태가 A 이고 읽은 기호가 & 이기 때문에 & 를 쓰고 오른쪽 칸으로 이동하고 상태 B 가 된다.

  3. 현 상태가 B 이고 읽은 기호가 _ 이기 때문에 _ 를 쓰고 왼쪽 칸으로 이동하고 상태 C 가 된다.

  4. (종료 할 때까지 반복)

### 문자로 표현된 기계를 읽고 그대로 흉내내는 기계 (보편만능기계, 컴퓨터)

그리고 튜링은 결론적으로 기계의 작동 방식을 표현한 그런 글을 입력으로 받아서 그대로 흉내내주는 기계, 즉 보편만능기계universal machine 를 소개한다. 그는 기계를 입력으로 받아서(**프로그램**) 그 기계의 행동을 그대로 흉내내주는 기계, 컴퓨터를 고안한 것이다. 물론 이 보편만능기계 또한 사람이 생각할 수 있는 기계 중 하나이기 때문에 4 가지 부품으로 설계될 수 있으며 텍스트로 표현될 수 있다. 당시 튜링은 이 컴퓨터의 이론적 모델이 된 기계를 보편만능기계universal machine 이라고 표현했다. 괴델이 불완전성 정리를 증명할 때 사용한 원시재귀함수primitive recursive function 을 튜링은 기계(**컴퓨터**)로 구현한 것이다. 그러니까 컴퓨터는 하나의 거대한 재귀 함수라고 생각된다.

### 보편만능기계(컴퓨터) 로도 할 수 없는 일 - 정지문제 

튜링은 이 보편만능기계로도 할 수 없는 일, 즉 "입력 받은 기계가 언젠가 멈출지 영원히 실행될지 판단하는 일(정지문제)" 은 절대로 불가능하다는 것을 증명함으써 괴델의 불완전성 정리를 자기만의 방식으로 증명한다.

- 정지 문제 : 어떤 프로그램과 입력을 받았을 때, 그 프로그램을 실행했을 때 유한한 단계 후에 끝날지 혹은 영원히 끝나지 않을지를 판별할 수 있는 문제

  - Q. 컴퓨터는 정지 문제를 해결 할 수 있을까?

  - A. **해결 할 수 없다.**

#### 증명 과정 (Halting problem)

> 귀류법 : 어떤 명제가 참임을 증명하려 할 때, 그 명제의 결론을 부정함으로써 가정 또는 공리등이 모순됨을 보며 간접적으로 그 결론이 성립한다는 것을 증명하는 방법.

앨런 튜링의 귀류법 증명

- 대전제 : 정지 문제를 판별하는 알고리즘이 `halting` 이 존재한다. 이 `halting` 함수는 임의의 프로그램과 그 프로그램에 전달될 인자를 인자로 받는다. 그리고 `halting` 함수는 인자로 전달된 프로그램이 정상적으로 종료되면 **true** 를 반환하고 영원히 종료되지 않으면 **false** 를 반환한다.

- 정지 문제를 판별하는 알고리즘 `halting(function, arg)` 함수

  - `function` : 임의의 프로그램.

  - `arg` : 임의의 프로그램 `function` 에 전달될 인자.

  - `halting` 함수의 반환값
  
    - `function` 이 정상적으로 종료된다면 **true** 를 반환한다. 

    - `function` 이 무한 루프에 빠진다면 **false** 를 반환한다. 

- 반례(Counter example) : 다음은 check 함수의 코드이다. `check` 함수는 임의의 함수 `function` 을 입력으로 받아서 내부적으로 `halting(function, function)` 를 호출하고 있다. (`function` 는 프로그램이지만 일련의 텍스트로 표현할 수 있기 때문에 인자로 전달될 수 있다) 그리고 전달된 `function` 이라는 인자를 `halting` 알고리즘에 전달하여 무한루프에 빠지는지, 정상적으로 종료되는지 체크하고 있다. 

  - `halting` 이 `true` 를 반환하면 `else` 문으로 넘어가는데 그곳에는 영원히 끝나지 않는 무한 루프 코드가 존재한다.

    ```c
    int check (function) {
    if (halting(function, function) == false)
        return true;
      else
        // Infinite loop
    }
    ```
  
- 증명 : 다음과 같이 이 `check` 함수의 인자에 `check` 함수 자신을 전달한다. 무한 루프에 빠진다면 `halting` 이 `false` 를 반환하여 `check` 함수는 `true` 를 반환 할 것이고, 만약 정상적으로 종료할 경우 `check` 함수는 무한루프에 빠질 것이다.

  ```c
  check(check);
  ```

  - 가정 1. `check(check)` 가 정상적으로 종료되었다. `halting(check, check)` 가 `true` 를 반환한다. 그러면 `else` 문으로 넘어가 무한루프를 돈다. 하지만 `check(check)` 은 정상적으로 종료하여야 한다고 했기 때문에 모순이다.
  
  - 가정 2. `check(check)` 가 무한 루프에 빠진다. 그러면 `halting(check, check)` 이 `false` 를 반환하여 `check` 함수가 `true` 를 반환하며 정상적으로 끝난다. 하지만 `check(check)` 는 무한루프에 빠져야 한다고 하였기 때문에 모순이다.

결론

- `halting(check, check)` 이 참도 거짓도 될 수 없다는 모순이 발생한다. 따라서 `halting` 알고리즘은 존재할 수 없다.

- 정지 문제를 해결할 알고리즘이 존재한다는 대전제가 붕괴된다.

## 폰 노이만 구조

튜링은 자신이 고안한 보편만능기계를 실질적으로 구현하지는 않았고 괴델의 불완전성 정리를 자신만의 방식으로 증명했을 뿐이다. 그러나 1939년 2차 세계 대전이 발발하면서 미국, 독일, 영국이 독자적으로 컴퓨터를 구현해서 전쟁에 필요한 정보 처리를 했다. 영국 정부는 튜링에게 히틀러가 이끄는 독일군의 암호 해독을 명령했고 튜링은 이 암호 해독에 자신이 고안했던 보편만능기계를 실질적인 컴퓨터로 구현하여 해독에 성공한다.

1945년 폰 노이만은 에드박EDVAC 보고서를 작성하는데 여기서 메모리에 프로그램과 데이터를 저장하는 컴퓨터 구조를 제안한다.

![폰 노이만 구조](https://joonecomics.files.wordpress.com/2016/11/img_0630.png)

## 이후에는

1947년 이후에는 진공관 대신 트랜지스터를 사용하여 컴퓨터를 개발하기 시작했고 1953년 IBM 이 650 와 700 시리즈를 컴퓨터를 상업적 목적으로 발표했다. 1963 년에 집적회로가 발명되어 초소규모 전자회로로 컴퓨터를 구동시키는 방식이 고안되었고 이 방식이 지금까지 쓰이고 있는 것이다.

천공카드로 프로그래밍을 해서 컴퓨터 입력하던 사람들이 컴퓨터 속도가 너무 빨라져서 컴퓨터가 멈춰있는 시간이 늘어났다는 것을 알게 되었다. 그래서 시간을 효율적으로 사용하기 위해 연속적으로 작업이 이루어질 수 있도록 하는 프로그램을 만들었고 이 프로그램은 하나의 프로그램이 끝나면 다음 프로그램을 실행할 수 있도록 관리하는 역할을 했다. 이것이 컴퓨터 자원을 효율적으로 사용하기 위해 개발된 최초의 운영체제이다. 원래 운영체제 없이 컴퓨터를 사용했는데 컴퓨터 자원 관리 프로그램 위에서 프로그램을 실행하면 훨씬 더 효율적이기 때문에 이후로 운영체제가 급속도로 발전 한 것이다.
  
1960년대 말 MIT 와 AT&T 벨 연구소에서 시분할 운영체제인 멀틱스를 만들었는데 멀틱스가 너무 복잡한 나머지 비용이 비싸지자 켄 톰슨과 데니스 리치가 중요한 기능만 추출하여 단순화 시킨 유닉스Unix를 개발하게 된다. 켄 톰슨과 데니스 리치는 어셈블리어로 유닉스Unix 를 코딩하다가 불편함을 느꼈고 개발한 것이 C 언어이다. 이 C 언어에서 C++, Java, Python 등 여러 프로그래밍 언어가 파생되었다. 그리고 MacOS, Linux 가 이 유닉스Unix 에서 파생되었고 스마트폰의 운영체제인 Android, Ubuntu, 그리고 Arch Linux 등이 Linux 에서 파생되었다.
  
1980 년 마이크로소프트가 MS-DOS(Microsoft Disk Operating System) 을 개발했고 1981 년 IBM 이 PC(개인용 컴퓨터) 를 발표했다. 3년 후인 1984년 애플이 맥킨토시 PC 를 발표했고 이후 iMac, Mac OS X, Macbook 등을 발표한다. 1990년대부터 마이크로소프트가 MS-DOS 에 GUI 환경을 얹어서 Windows 운영체제를 발표했다.

---

# 간단하게 살펴보는 컴퓨터의 구조와 작동 원리 (1)

## 2진수, 8진수, 16진수 표기법

- n 진수는 한 자리에 0 부터 (n-1) 까지의 숫자까지 나타낼 수 있다. 예를들어 2진수는 한 자리에 0 또는 1 을 나타낼 수 있고 우리가 자주 쓰는 10진수는 한 자리에 0 부터 9 까지의 숫자를 나타낼 수 있다. 그래서 16진수도 한 자리에 0 부터 15 까지 나타낼 수 있는데 아라비아 숫자가 0 부터 9 까지밖에 없기 때문에 10, 11, 12, 13, 14, 15 는 각각 a, b, c, d, e, f 로 나타낸다. 대문자 A, B, C, D, E, F 로 나타내기도 한다.

- 컴퓨터에서 숫자 앞에 0x 를 붙히면 heXadecimal, 즉 16진수로 나타내겠다는 뜻이고 0o 을 붙히면 Octal, 즉 8 진수로 나타내겠다는 뜻이다. [이 링크](https://ko.wikipedia.org/wiki/%EC%8B%AD%EC%9C%A1%EC%A7%84%EB%B2%95)에서 16 진수와 10 진수를 대조해보자.

## 컴퓨터가 데이터를 저장하는 방식

[https://www.geeksforgeeks.org/little-and-big-endian-mystery/](https://www.geeksforgeeks.org/little-and-big-endian-mystery)

![datatype](https://user-images.githubusercontent.com/16812446/72770971-cd69ea00-3c42-11ea-9098-7a65e5b416cd.PNG)

이건 이미 알고 있을만한 C 언어의 데이터 타입이다. 하지만 하드웨어의 관점에서 호칭되는 데이터 타입은 다음과 같다.

![cpudatatype](https://user-images.githubusercontent.com/16812446/72770996-df4b8d00-3c42-11ea-9c50-fc5b67a43010.PNG)

이 데이터 타입에 실질적으로 데이터를 저장하는 방식은 아키텍쳐 마다 두 가지 방식으로 나뉜다. 데이터를 정순서로 저장하는 빅 엔디언 방식, 데이터를 역순서로 저장하는 리틀 엔디언 방식이 그것이다. 만약 4 바이트 자료형에 0x01234567 의 값을 저장한다면 각각 다음의 그림처럼 저장된다.

![lb](https://user-images.githubusercontent.com/16812446/72771017-e96d8b80-3c42-11ea-8b6d-9b117ef51ad9.GIF)

요즘 컴퓨터들은 CPU 연산 방식 특성상 데이터를 역순서로 저장해야 연산을 좀 더 빠르게 할 수 있기 때문에 리틀 엔디안 방식을 주로 채용한다. 다음과 같은 간단한 C 프로그램으로 나의 컴퓨터가 리틀 엔디언인지 빅 엔디언인지 확인할 수 있다.

[check_little_or_big.c](check_little_or_big.c)

```c
// https://www.geeksforgeeks.org/little-and-big-endian-mystery/
#include <stdio.h>

/* function to show bytes in memory, from location start to start+n*/
void show_mem_rep(char *start, int n)
{
    int i;
    for (i = 0; i < n; i++)
         printf(" %.2x", start[i]);
    printf("\n");
}

/*Main function to call above function for 0x01234567*/
int main()
{
   int i = 0x01234567;
   show_mem_rep((char *)&i, sizeof(i));
   getchar();
   return 0;
}
```

리틀 엔디언이면 `67 45 23 01` 이 출력되고 빅 엔디언이면 `01 23 45 67` 이 출력된다. 왠만하면 리틀 엔디언 방식으로 출력될 것이다.

## CPU 레지스터

![CPU/RAM/Disk](https://www.researchgate.net/profile/Niels_Nes/publication/4234735/figure/fig1/AS:394707659182081@1471117047077/I-O-RAM-vs-RAM-CPU-compression.png)

위의 그림과 같이 CPU 는 RAM 에서 프로그램을 읽고 실행하기 위하여 임시 저장소인 레지스터를 사용한다.

HDD 또는 SSD 를 도서관이라고 비유해보자. 그러면 도서관에서 빌려서 가방에 들어있는 책을 RAM 이라고 할 수 있다. 그리고 책을 읽으려고 가방에서 책을 책상으로 꺼내놓았는데 바로 이 책상 위 공간을 레지스터라고 할 수 있다. 하지만 책상의 크기가 작아서 책을 많이 올려놓을 수 없듯이 레지스터에도 데이터를 많이는 저장하지 못한다. 그러나 접근 속도는 책상(레지스터)이 제일 빠르고 그것보다 좀 더 느린 것이 가방(RAM), 가장 느린 것은 도서관(HDD 또는 SSD)이 된다.

### `RAM` 에 저장하는 변수와 `register` 에 저장하는 변수의 속도 차이 실험 

- 이 프로그램 [reg_vs_ram.c](reg_vs_ram.c) 으로 `RAM` 과 `register` 와의 속도 차이를 실감해보자. 

- **Arch Linux x86_64** 환경에서 **gcc 9.2.0** 컴파일러로 컴파일 후 실행 결과 다음과 같은 확연한 속도 차이를 볼 수 있었다. 한번 본인의 컴퓨터에서 실행해보자. 

  ```shell
  $ gcc reg_vs_ram.c && ./a.out
  Performance test ram variables
  (10000000 loops)        18.6 msec
  (1000000000 loops)      2.1 secs
  Performance test registers variables
  (10000000 loops)        2.6 msec
  (1000000000 loops)      0.3 secs
  ```

어쨌든 CPU 가 레지스터를 사용하는 방법을 아는 것이 컴퓨터 작동 방식의 구체적 원리를 이해하는 첫걸음이다.

### 범용 레지스터 General Register

- 범용 레지스터 : "여러가지로(범) 널리 쓰이는(용)" 레지스터이다.

    ![register](https://user-images.githubusercontent.com/16812446/72771046-ff7b4c00-3c42-11ea-9691-7f6ac3cd07fa.PNG)

  - 옛날 옛적 `16` 비트 메모리 시스템을 사용할 때 레지스터들은 `ax`, `bx`, `cx`, `dx` 등으로 불리웠는데 `32` 비트 메모리를 사용하기 시작하면서 `16` 비트 레지스터에서 확장extend 했다는 의미로 e 를 붙혀서 `eax`, `ebx`, `ecx`, `edx` 로 바꿔서 불렀다. 비슷하게 `64` 비트 메모리 시스템의 레지스터는 `rax`, `rbx`, `rcx`, `rdx` 라는 식으로 부른다.

    ![register-usage](https://user-images.githubusercontent.com/16812446/73092168-6b013a00-3f1f-11ea-8d77-0777643cbfb1.png)

  - 그렇다고 `64` 비트 메모리 시스템에서 `eax` 나 `ax`, `al` 을 사용하지 않는 것이 아니다. 위의 그림과 같이 `64` 비트 메모리 시스템에서 `32` 비트 메모리에만 접근하고 싶을 때 `eax` 를 사용하고 `16` 비트 메모리에만 접근하고 싶을 때는 `ax`, `8` 비트 메모리만 다루고 싶을 땐 `al` 을 사용한다.

  - 사실상 `al`, `ax`, `eax`, `rax` 가 모두 하나의 레지스터를 다루는 것이다. 마찬가지로 `bl`, `bx`, `ebx`, `rbx` 도 하나의 레지스터를 다루게 된다. 

### 스택 포인터 Stack Pointer (`rbp, rsp`)

- 스택 포인터 `rbp`, `rsp` : 스택 영역을 가르키기 위한 레지스터이다. 

  - 프로그램이 HDD 또는 SSD 에서 RAM 에 로드된 후 크게 Text 영역, Data 영역, Heap 영역, Stack 영역으로 나뉘어서 로딩되는데 그 중에서 Stack 영역의 시작과 끝을 가르키기 위한 레지스터이다.
  
  - `rbp` 레지스터가 스택의 시작을 가르키고 `rsp` 레지스터가 스택의 밑바닥을 가르킨다.

  - `rsp` 와 `rbp` 은 원래 `sp`, `bp` 로써 각각 stack pointer, base pointer 라는 뜻이고 `32` 비트 메모리 시스템에서 `esp`, `ebp` 로 호칭되다가 `64` 비트 메모리에서는 `rsp`, `rbp` 가 되었다. 

### 프로그램 카운터 Program Counter(`rip`)

- 프로그램 카운터 `rip` : **CPU** 가 다음에 실행할 명령어의 주소값을 저장하고 있는 레지스터이다. 

  - 그래서 디버깅을 하면서 `rip` 레지스터의 값을 수정함으로써 프로그램의 흐름을 바꿀 수도 있다.

  - 운영체제의 개념으로 **PC (Program Counter)** 라고 부른다.
  
  - `rip` 도 마찬가지로 `32` 비트 메모리 시스템에서 보면 `eip` 로 보인다. 


### FLAG 레지스터


![flag-register-1](https://user-images.githubusercontent.com/16812446/72771080-19b52a00-3c43-11ea-9a71-91ff62ced806.PNG)

![flag-register-2](https://user-images.githubusercontent.com/16812446/72771094-22a5fb80-3c43-11ea-8a7b-badba2efed1d.PNG)


- FLAG 레지스터 : 위 그림과 같이 CPU 의 여러가지 상태를 나타낸다.

  - 위 그림과 같이 각각의 비트 필드에 고유의 의미가 부여된다. 

---

# 어셈블리어 (1)

[https://ko.wikipedia.org/wiki/어셈블리어](https://ko.wikipedia.org/wiki/어셈블리어)

[https://namu.wiki/w/%EC%96%B4%EC%85%88%EB%B8%94%EB%A6%AC%EC%96%B4](https://namu.wiki/w/%EC%96%B4%EC%85%88%EB%B8%94%EB%A6%AC%EC%96%B4)

[http://www.egr.unlv.edu/~ed/assembly64.pdf](http://www.egr.unlv.edu/~ed/assembly64.pdf)

[https://cs.lmu.edu/~ray/notes/x86assembly/](https://cs.lmu.edu/~ray/notes/x86assembly/)

> 지금부터하는 설명들은 위의 출처로부터 내용을 적절히 다이제스트 했다는 것을 밝힙니다.

- 어셈블리어 : 기계어와 일대일 대응 되는 프로그래밍 언어이다.

  - 어셈블리어는 일반적인 프로그래밍 언어와는 다르게 컴파일러가 아닌 어셈블러를 통해서 코드를 기계어로 번역하고 반대로 디스어셈블러로 기계어를 어셈블리어로 번역할 수 있다. 기계어는 컴퓨터 CPU 가 읽어서 실행할 수 있는 `0` 과 `1` 의 조합인데 예를 들면 다음과 같다.

    `10110000 01100001`

    사실 이 `0` 과 `1` 도 각각 `1V` 와 `5V` 를 나타내기 위한 표현식이다. 실제로 CPU 에 전달될 때 정말 `0` 과 `1` 이 전달되는 것이 아니다. 어쨌든 이것은 x86 계열 CPU 기계어 명령이고 어셈블리어로 번역하면 이렇다.

    `mov al, 061h`

  - 컴퓨터가 만들어지기 얼마 지나지 않았을 때 폰 노이만의 제자가 기계어로 코딩하는 것이 너무 힘들어서 어셈블리어를 만들자 폰 노이만이 기계어로 코딩하는 게 뭐가 힘들어서 컴퓨터 성능을 낭비하냐고 꾸짖었다고 한다. 하지만 현실은 그 어셈블리어로 코딩하는 것도 힘들어서 C 언어가 개발되었고 C 언어도 힘들어서 Python 이 개발되었다.

  - 컴퓨터는 위에서 설명한 레지스터를 사용하여 여러 연산을 함으로써 프로그램의 기능을 수행한다. 수백가지의 프로그래밍 언어가 있지만 모든 프로그래밍 언어는 컴파일러에 의해 기계어와 1:1 대응되는 어셈블리어로 번역되어 실행가능한 바이너리 파일로 컴파일된다. 

  - x86_64 의 어셈블리어 표현 방식에는 크게 Intel 방식 AT&T 방식이 있는데 지금은 좀 더 대중적인 Intel 방식의 어셈블리어를 알아보자. 

## 데이터 저장 (`mov`, `lea`)

`int n = 100;` 이나 `char * str = (char *) arr` 같은 코드들이 내부적으로 다음과 같은 어셈블리어를 사용하고 있다.

- `mov <dest> <src>` : 데이터를 저장하는 명령어의 형식은 위와 같다. dest 는 목적지destination 의 준말이고 src 는 소스source 의 준말이다.

  ```assembly
  mov eax, 100 ; eax 레지스터에 100 을 저장
  mov rcx, rbx ; rcx 레지스터에 rbx 값을 저장
  ```

- `mov <dest> datatype[location]` : mov 명령어로 주소값에 있는 값을 저장할 수도 있다.

  ```assembly
  mov eax, dword [0x400567] ; 0x400567 의 메모리 주소에 있는 값을 dword(double word 의 준말) 만큼 eax 에 저장
  mov eax, qword [rbp + rsi + 5] ; rbp + rsi + 5 의 메모리 주소에 있는 값을 qword(쿼드러플 워드) 만큼 eax 에 저장
  mov [rbp + rsi + 5], eax ; rbp + rsi + 5 의 메모리 주소에 있는 값을 eax 레지스터에 저장되어 있는 값으로 바꾼다
  ```

- `lea <dest> datatype[location]` : mov 처럼 [ ] 를 사용하는데 메모리에 접근하는 것이 아니라 단순히 산술연산만을 수행한다.

  ```assembly
  lea eax, dword [rbp + rsi + 5] ; 단순히 rbp + rsi + 5 의 값을 eax 에 저장
  mov eax, dword [rbp + rsi + 5] ; mov 는 rbp + rsi + 5 의 메모리 주소에 있는 값을 저장
  ```

## 산술 연산 (`add`, `sub`)

CPU 가 +, - 연산을 할 때 내부적으로 이 어셈블리어를 사용한다.

- `add <dest> <src>` : `<dest> = <dest> + <src>` 의 의미이다.

  ```assembly
  add cx, word [wVvar]    ; cx 에 xVvar 를 더함
  add rax, 42             ; rax 에 42 를 더함
  ```

- `sub <dest> <src>` : `<dest> = <dest> - <src>` 의 의미이다.

  ```assembly
  sub cx, word [wVvar]    ; cx 에 xVvar 를 뺌
  sub rax, 42             ; rax 에 42 를 뺌
  ```

## 논리 연산 (`and`, `or`, `xor`)

![truth-table](https://user-images.githubusercontent.com/16812446/72771110-30f41780-3c43-11ea-9776-fb067a2cf1ed.PNG)

and, or, xor 의 논리 연산은 복습하는 차원에서 위의 표를 한 번씩 살펴보고 넘어가자. `&, |, ^` 연산을 할 때 내부적으로 이 어셈블리어를 사용한다.

- `and <dest> <src>` : 다음과 같이 AND 연산을 수행한다. `<dest> = <dest> & <src>`

  ```assembly
  and rcx, rdx
  and eax, dword [dNum]
  ```

- `or <dest> <src>` : 다음과 같이 OR 연산을 수행한다. `<dest> = <dest> | <src>`

- `xor <dest> <src>` : 다음과 같이 XOR 연산을 수행한다. `<dest> = <dest> ^ <src>`

## 분기 명령어

C 언어에서 goto 문을 사용할 때 라벨을 사용하는데 `loopStart:` 나 `last:` 와 같이 라벨을 지정해준다. 어셈블리어의 분기명령어는 이러한 라벨 또는 주소값을 지정하여 프로그램의 흐름을 바꾼다.

### 무조건 분기 명령 (`jmp`)

- `jmp <label>` or `jmp <location>`

  - 조건없이 `<label>` 또는 `<location>` 으로 점프해서 프로그램의 흐름을 바꾼다. PC (Program Counter) 즉 rip 레지스터를 `<label>` 또는 `<location>` 으로 변경한다는 의미이다.

  - jmp 대신 j 라고도 쓰인다. 

### 조건 분기 명령 (`je`, `jne`, `jle`, `jge`)

조건 분기 명령은 무조건 분기하는 것이 아니라 조건이 만족되어야만 분기 한다. `if-else` 문과 `switch-case` 문이 이 어셈블리어를 사용한다. 또한 `for` 문과 `while`, `do-while` 문도 조건 분기 명령을 내부적으로 사용한다.

조건 분기는 2 단계로 이루어지는데 첫번째 단계는 값을 비교하여 Flag 레지스터에 결과를 저장하는 것이고, 두번째 단계는 Flag 레지스터의 결과에 따라 분기를 선택하는 것이다.

- `cmp <op1> <op2>` : `<op1>` 과 `<op2>` 를 비교하여 결과값을 Flag 레지스터에 저장한다. 

  - 그 첫번째 단계가 cmp 명령어로 `<op1>` 과 `<op2>` 를 비교하는 것이다. 

    ```assembly
    cmp rax, 5
    cmp ecx, edx
    cmp ax, word [wNum]
    ```
  
  - 조건 문기 명령어들은 cmp 명령어의 결과에 따라 다음과 같이 정의된다. je 는 jump-if-equal 이라는 뜻으로 `<op1>` == `<op2>` 이면 `<label>` 로 프로그램의 흐름을 변경한다는 말이다. jne 는 jump-if-not-equal 이라는 뜻이다. 나머지도 직관적으로 이해할 수 있다.

    ![conditional-jmp](https://user-images.githubusercontent.com/16812446/72771126-3e110680-3c43-11ea-8922-aebb4244c2d7.PNG)

## system call

https://ko.wikipedia.org/wiki/%EC%8B%9C%EC%8A%A4%ED%85%9C_%ED%98%B8%EC%B6%9C

하지만 이런 어셈블리어들만 가지고는 쓸만한 프로그램을 만들 수 없다. 그래서 하드웨어와 커널에서 제공하는 서비스를 호출할 수 있어야 하는데 시스템 콜이 그것이 가능하게 해준다.

- 시스템 콜 system call : 유저 레벨 프로그램이 커널 레벨 서비스를 사용하고 싶을 때 커널에게 요청하기 위한 도구이다.

  - 시스템 콜은 프로세스 제어, 파일 조작, 장치 관리, 통신 등등에 사용된다. 다음 C 프로그램을 보자.

    [simple_write.c](simple_write.c)
    ```c
    #include <unistd.h>
    
    void main(void) {
        write(1, "Hello!\n", 7);
        pause();
    }
    ```

    실행하면 Hello! 문자열이 출력된다.
  
  - 시스템 콜은 다음과 같이 인자를 전달받는다. `rax` 레지스터에 시스템 콜 종류를 지정해야 한다. 시스템 콜 종류는 `read`, `write`, `exit` 등등 매우 다양하다. 

    ![syscall](https://user-images.githubusercontent.com/16812446/72771141-49fcc880-3c43-11ea-9a92-2b31d8c64965.PNG)

  - printf 계열의 출력 함수는 내부적으로 write 함수를 사용하고 write 함수는 내부적으로 위와 같이 레지스터를 초기화 한 후 syscall 을 호출한다.

    ```assembly
    mov rax, 1
    mov rdi, 1
    mov rsi, ("Hello!\n" 의 주소값)
    mov rdx, 7
    syscall
    ```
    
    그래서 위와 같은 어셈블리 코드가 방금 본 C 프로그램과 똑같은 기능을 수행된다. 출력하는 시스템 콜은 1 번이기 때문에 rax 를 1번으로 초기화해주고 시스템 콜이 요구하는 인자를 적절히 설정해주어야 한다. x86_64 아키텍쳐에서의 리눅스 시스템 콜 리스트는 [이 링크에 나와있다.](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)

---

## 과제

### 과제 가이드

1. [HW-2.md](HW-2/HW-2.md) 파일의 지시를 따르는 것이 과제이다. (발표를 하며 설명을 할 수 있어야 합니다)

2. 과제 파일은 [HW-2](HW-2) 디렉토리에 만들어야 한다.

3. 과제 파일이 완성되면 다음 명령어를 참고하여 완성된 과제를 푸쉬한다.

```shell
cd /path/to/security
git add .
git commit -m "complete HW-2"
git push -u origin master
```

4. 마지막으로 `pull requests` 를 한다.
