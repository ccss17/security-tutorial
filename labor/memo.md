

함수 포인터 https://dojang.io/mod/page/view.php?id=593

RTL

ROP

나머지 2일 또는 3일을 토르 프록시랑 안드로이드랑 웹 취약점 

bluefunction 분석 
  1. 초반부 로직을 분석해보면, blue 함수를 분석해보면 입력한 문자열을 buffer 에서 eax 로 한 바이트씩 저장한다. 그 eax, 즉 입력받은 문자열의 첫문자를 각각 0x4c('L'), 0x52('R'), 0xa('\n') 와 비교하고 모두 같지 않으면 폭탄이 터짐. 

  2. 일단, wire_blue 를 0 으로 만들어야 폭탄이 해체된다는 것을 이미 알고 있기 때문에 wire_blue 를 0 으로 만드는 코드를 결정하는 분기점에 breakpoint 를 건다. 

  3. 분기를 결정하는 시점에서 eax 는 0x40475194 로 초기화되고 이 eax 를 [ebp - 8] 과 비교하고 있다. eax 는 상수로 고정되어 있으므로 [ebp - 8] 이 입력값에 따른 변수라고 생각된다. 이 가정이 맞다면 분기를 결정하는 요소는 [ebp - 8] 이다. 

  4. 그렇다면 [ebp - 8] 을 결정하는 요소는 무엇인지 찾자.

     - `0x8049a09 -> xor dword[ebp - 8], eax` : 이 시점에서 eax 는 상수로 변하지 않는다. 즉 입력값과 관계 없이 똑같은 값을 갖는다. 

     - `0x8049a7d -> xor dword[ebp - 8], eax` : 그러므로 이 코드에서의 eax 가 입력값에 따른 변수 일거라고 유추된다. 그리고 이제 이 eax 는 [ebp - 4] 가 결정한다. 
  
  5. 이제 [ebp - 4] 를 결정하는 요소를 찾아야 한다.

     - `0x80499fc -> mov dword [var_h], obj.graph` : [ebp - 4] 의 초기값. obj.graph 는 상수로써 입력값과 관계없이 똑같은 값을 갖는다. 

     - `0x8049a45 -> mov dward [ebp - 4], eax` : [ebp - 4] 가 eax 에 의해 초기화되지만 이전 명령어에서 eax 는 [[ebp - 4]] (더블 포인팅) 와 같다. 이 코드를 A 라고 하자. 그러면 A 는 [ebp - 4] 가 포인팅하고 있는 값으로 [ebp - 4] 를 바꾸는 기능을 한다. 

     - `0x8049a50 -> mov dward [ebp - 4], eax` : [ebp - 4] 가 eax 에 의해 초기화되지만 이전 명령어에서 eax 는 [[ebp - 4] + 8] 이다. 이 코드를 B 라고 하자. 이 B 는 [ebp - 4] 가 더블 포인팅하고 있는 값으로 [ebp - 4] 를 바꾸는 기능을 한다. 

     - 그러므로 `0x8049a45` 와 `0x8049a50` 을 단일 명령어로만 보았을 때 입력값과 관계 없는 상수로써 분기를 결정할 수 없어보인다. 그러나 이 두 명령어는 각각 입력값의 첫문자가 'L' 일 때 그리고 'R' 일 때 실행되는 루프문의 명령어이다. 그렇기 때문에 입력값에 따라서 [ebp - 4] 이 변한다. 
   
  6. 이제 입력값이 최종 분기점과 어떻게 연결되는지 이해하였으니 분기를 조작할 수 있다. 입력값이 최종 분기점까지 어떻게 연결되는지 다시 복기해보자. 

     1. wire_blue 를 0 으로 만드는 로직에서 0x40475194 로 초기화된 eax 가 [ebp - 8] 과 비교된다. eax 는 상수이므로 [ebp - 8] 에 대하여 조사하였다.

     2. [ebp - 8] 은 `0x8049a7d` 에서 [ebp - 4] 로 초기화된다.

     3. [ebp - 4] 는 사용자가 입력한 입력값에 따라서 `0x8049a45` 의 코드나 `0x8049a50` 의 코드가 실행되면서 변한다. 

     4. [ebp - 4] 의 초기값은 0x804c160 이고 이 값은 연달아서 어떤 값들은 포인팅 한다. 0x804c160 -> 0x804c19c -> 0x804c1cc -> 0x804c1f0  —▸ 0x804c184 —▸ 0x804c19c 

### 프로그램 형식

- Window : PE

- Linux : ELF

- Mac : Mach-O

# 예비 

ftz, 달고나, 블랙펄 블로그 

5일 - 익스플로잇 시작 - BOF, 함수 흐름 바꾸는 법, 쉘코드, RTL, ROP 같은 거 

# 바텀업 컴퓨ㅓ

운영체제별 실행 파일 포맷

이거 보여줄 때 ASLR 같이 설명, 그리고 executalbe 메모리 영역,  메모리 영역 권한 설명

그럼 이제 일단 gdb 사용법 ida 사용법 올리디버거 사용법
먼저 간단한 헬로월드를 gdb 로 디버깅 해보는 연습 같이 해주고 간단한 함수 호출 하는 걸 디버깅 하능거 해주소 scanf 로 입력 받는거 디버깅 한 번 해주고.
그러면서 레지스터와 메모리와 어셈블리어를 확인 시켜주고 디버깅 되면서 어떻게 변하는지 함수호출 되면서 어떻게 변하는지.

마지막으로 이렇게 수작으로 할 필요 없이 msfvenome 이나 gdb-gef 의 shellcode 명령으로 쉘코드를 사용하는 방법 보여주기. 그래서 여기에서 재미를 추가한다면 실시간으로 백준에서 엄청 쉬운 문제를 C 언얼 ㅗ풀게 한다음에  그걸 가져오게 해서 파싱한 다음 쉘코드를 따내게 해서 각자 쉘코드로 백준에서 푼 문제를 실행시켜보게 하는 해주는 것도 재밌겠지.

# 다른 보안 부냥 

플루터로 엄청 간단한 어플 만들고 그 어플을 디컴파일 하면 키값을 알아낼 수 있는 숙제를 내주는 거지. 

프록시, 토르, VPN - check.torproject.org 랑 ipleak.com 에서 보이는 IP 가 어떻게 달라지는지 확인 ---> 좀 더 재밌게 가려면 우리 서버에서 express 서버 하나 대충 켜서 lnav 명령어로 HTTP 로그 찍히는 걸 확인시킨 후 프록시를 켰을 때 IP 가 어떻게 달라지는지 보여주는거 ===> 하루동안 이거 하게 되면 숙제는 어떤 식으로 내볼까. 
===>> 우분투 서버에 7777 포트 방화벽 열고 torrc 에서 0.0.0.0:7777 로 한 다음에 로컬에서 54.180.132.66:7777 로 프록시 태운 다음에   https://check.torproject.org/ 여기에서 토르 프록시 ㅊㅊ체크해보니까 토르 프로시 타고 있다고 나온다 --> 이 말뜻은 학교에서도 이 우분투 서버로 tor 프록시 태울 수 있다는 얘기. 
====> 그럼 숙제로 tor 프록시를 타고 다크웹을 돌아다니면서 자신이 발견한 사이트를 발표하는 걸로 하면 꽤 재밌겠네. 그리고 tor 프록시랑 vpn 동시에 태우게 하고 자신의 ip 가 원래 이거였는데 이걸로 바뀌었다는 설명 꼭 하라고 하면 되겠다 ipleak.net 을 통해서 해도 되고 뭐 다른 걸로 해도 되고. 그리고 다크웹에서 운영중인 공식 페이스북 페이지를 찾아보라고 시키는 것도 괜찮겠네. or 다크웹에서 운영중인 성경 사이트 찾기 

그리고 -- DNS 프록시로도 우회할 수 있다는 거 
http://www.squid-cache.org/Doc/config/ 여기 dns 프록시로 우회 가능
DNS 프록시 메모
  먼저 sudo systemctl start dnscrypt-proxy.service 를 사용할 거면 /etc/dnscrypt-proxy.toml 의 listen_addresses = ['127.0.0.1:53', '[::1]:53'] 이렇게 해줘야함
  근데 sudo systemctl start dnscrypt-proxy.socket 을 사용할 거면 listen_addresses = [ ] 이렇게 해줘야 함. 
그러고 난 후 /etc/resolv.conf 를 
  nameserver ::1
  nameserver 127.0.0.1
  options edns0 single-request-reopen
이렇게 고쳐줘야 함
프록시 시간에 할 거 VPN, dns 프록시, http 프로시, socks 프록시(ssh 터널), tor 프록시, mac 주소 변경. 

대충 1일차 정보보안개요 2일 시스템구조 및 어셈코딩 3일,4일 리버싱 5일 토르프록시 
그다음주 1일차 BOF 2일차 shellcode 3일차 리턴 체이닝, RTL or ROP 4일,5일 웹해킹 xss, injection, fileupload, filedownload 취약점 등

# 일정 

## 보안 1주차 

- 1일차

  - 쉘 코드 , ASLR , non-executable stack , ROP , RTL , BOF , HOF 

  - 쉘 정도는 할 줄 알아야 함. 컴퓨터에서 되는 일들을 코드로 표현할 줄 알아야 악성코드를 짤 수 있게 되기 떄문에
    - 윈도우에서는 bat, 파워쉘
    - Unix-like 에서는 콘쉘 스크립트, 배쉬쉘 스크립트 
    - 각자의 C&C 서버를 만들도록 하는 것도 괜찮겠다. 노드js express 로 각자의 포트 정하게 하는 거지. 

CTF 플랫폼 
https://platform.avatao.com/challenges/e63cb4dd-4777-4d2d-b81d-a822277983bc
awesome ctf
https://ctf.link/

r2 레퍼런스 
https://legacy.gitbook.com/download/pdf/book/radare/radare2book

뉴블라 가상머신 
https://drive.google.com/folderview?id=0B9RbZkKdRR8qLWZBcVBvanlLb1U&usp=sharing

  - 기본적인 툴 사용법
    - check.sh
    - r2
    - gdb
    - ida
    - ollydbg
    - nmap
    - zenmap
    - wireshark
    - fiddler
    - jd-gui
    - apktool
    - PEView
    - TMAC
    - elf 툴들
    - msfconsole, msfvenome

  - awesome 시리즈 레포지토리 
  - 파이썬 requests / bs4 / pwntool 
  - 파이썬 어느정도 연습한 후 크롤링 하루 하면 되겠네 
    - 그래서 숙제로 크롤링 해오기? 

# 네트워크 심화
- 터널링
- 프록시
- tor 서킷
- 포트스캔
- 와이어샤크
- 피들러
- 파이썬 requests 와 selenium
- (옵션) 패킷 헤더 변장 fake_useragent like 모듈
- (옵션) 여러가지 패킷 기반 공격들