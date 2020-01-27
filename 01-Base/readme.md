# 왜 보안을 공부해야 할까? 

## 주관적으로 생각해본 컴퓨터 보안 공부를 해야 하는 한 가지 이유 

### 기술적 특이점

  [https://ko.wikipedia.org/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81_%ED%8A%B9%EC%9D%B4%EC%A0%90](https://ko.wikipedia.org/wiki/%EA%B8%B0%EC%88%A0%EC%A0%81_%ED%8A%B9%EC%9D%B4%EC%A0%90)

  기술적 특이점은 인공지능의 발전이 가속화 되어 모든 인류의 지성을 합친 것보다 더 뛰어한 초지능이 개발되는 시점을 말한다. 이 시점부터 초지능이 인간의 생활상을 되돌릴 수 없을 정도로 빠르게 바꾸어 버릴 것이고 영향력을 미칠 것이다. 구글 엔지니어이자 인공지능 과학자 겸 미래학자 레이 커즈와일은 지금 인공지능 발전 속도로 미루어보아 2040년에 인공지능이 특이점에 도달할 것이고 이후 인류가 인공지능에 의해 멸종하거나 나노 로봇의 도움을 받아 영생할 거라고 예측했다. 

- **앨런 튜링**

> 생각하는 기계가 발명될 수 있다면 인간의 지능을 금세 따라잡을 수 있을 것이다. …(중략)… 그 시기가 온다면 새뮤얼 버틀러가 그의 소설 에레혼에서 쓴 것과 같이 기계가 권력을 쥐게 될 것이다.

- **폰 노이만**

> 인공지능은 인간의 지능을 초월할 수 있는 시스템을 의미한다. 이러한 인공지능의 발전은 스스로의 지적 능력의 일부가 되므로 결국 과학의 급속한 발전을 이루어 낼 것이며 결국 인공지능은 인간이 만들어낸 마지막 발명품이 될 것이다.

- 수학자 겸 작가 **버너 빈지**

> 인간들은 곧 우리의 지능보다 더 뛰어난 지능을 가진 기계를 발명해 낼 것이다. 그리고 이러한 발명이 이루어 질 때 우리는 특이점의 시대를 맞아들이게 될 것이다. 블랙홀의 중심에서 더 이상 되돌아 갈 수 없는 사상의 지평선이 이루어지는 것과 같이, 우리는 더 이상 이전의 무지의 상태로 되돌아 갈 수 없게 될 것이다.


### 약인공지능과 강인공지능

  [http://www.zdnet.co.kr/view/?no=20160622145838&from=Mobile](http://www.zdnet.co.kr/view/?no=20160622145838&from=Mobile)
  
- 약인공지능 : 확률과 통계 분석을 통해서 인간에게 도움을 주는 인공지능. 예를들어 자동청소기, 자율주행차, 알파고 등이 있다.

- 강인공지능 : 스스로 생각하고 실질적인 지능이 있으며 사람의 능력을 뛰어넘어는 인공지능을 뜻한다. 

    강인공지능에 대한 연구가 20세기 중반부터 있어왔지만 결과물이 없었기 때문에 1970년대부터 지원금이 끊겼고 실패한 프로젝트로 여겨졌다. 하지만 현대에는 지도학습, 비지도학습, 강화학습 같은 머신러닝으로 약인공지능이 부각되었고 기술적 특이점을 뜻하는 강인공지능의 출현이 예고되었다.

### 나의 **주관적인** 결론 

약 인공지능인 알파고도 인류에서 바둑으로는 최정상인 이세돌을 이겼다. 그런데 강인공지능이 해킹을 학습하기 시작하고 그 해킹을 악용한다면 어떻게 될까? 인류는 이미 IT 기술에 많이 의존하고 있기 때문에 돌이킬 수 없는 세상이 올 수도 있다. 그래서 컴퓨터 보안을 하는 인공지능을 학습시키기 위한 일환으로 컴퓨터 보안공부를 해보자. 

> 한 번쯤 인공지능과 컴퓨터 보안을 공부하는 이유, 좀 더 나아가서 컴퓨터 공학을 공부하는 이유에 대해서 생각해봅시다.

---

# Information security

[https://en.wikipedia.org/wiki/Information_security](https://en.wikipedia.org/wiki/Information_security)

정보 보안의 목적은 데이터를 사용하는 개인 및 단체의 생산성을 해치지 않으면서 데이터의 기밀성, 무결성, 가용성을 지키는 것이다. 

## History

초기의 정보보안은 군대의 사령관들이 자신의 메시지를 적들에게 노출시키지 않는 기밀성을 지켜야할 필요성을 느끼면서 시작되었다. 카이사르는 B.C 50 에 Caesar cipher 를 만들어서 그의 메시지를 암호화시켰다.  

그 이후로 메시지의 암호화가 계속 발전하다가 19 세기 중반부터 정보의 민감성에 따른 좀 더 복잡한 정보보안 시스템이 요구되었고 개발되었다. 예를들어 세계 1차 대전 때 multi-tier classification systems 이 정보 통신에 사용되었다. 그 와중에 기계와 컴퓨터가 발전하면서 암호화 및 복호화는 좀 더 정교해졌다.  

20세기 말, 그리고 21세기 초에 정보통신기술, 하드웨어 및 소프트웨어, 데이터 암호화 기술들이 급격히 발전했다. 이러면서 컴퓨터가 인터넷을 통해 데이터를 교환하기 시작했고 정보보안에 대한 필요성은 더욱 높아졌다. 

## Definitions

정보보안의 정의는 다음과 같다. 

1. "정보의 기밀성, 무결성, 그리고 가용성의 보존이다. Note: 추가적으로 확실성, 책임추적가능, 부인방지, 신뢰성 또한 포함되어야 한다." (ISO/IEC 27000:2009)

2. "오직 승인된 사용자(기밀성)만이 정확하고 온전한(무결성) 정보에 원하는 시기에(가용성) 접근할 수 있도록 보장하는 것이다." (ISACA, 2008)

## 정보보안이 지켜야 할 세 가지 원칙 - Basic Principles 

- Confidentiality(기밀성) : 정보보안에서 기밀성이란 정보가 승인되지 않은 개인, 개체, 과정에 노출되거나 사용가능하지 않아야 하는 것이다. 예를 들어 비밀번호 도난, 민감한 이메일이 부정확한 목적지에 도착하는 것 등을 들 수 있다. 

- Integrity(무결성) : 정보보안에서 무결성이란 승인되지 않거나 탐지되지 않은 방법으로 데이터를 수정할 수 없어야 한다는 것이다.

- Availability(가용성) : 어떤 정보 시스템에서 정보가 필요할 때 사용가능해야 한다는 것이다.

## 그러면 어떻게 정보보안을 구현하는가? 

### Access control

보호된 정보에 대한 접근은 반드시 승인된 사용자만 접근할 수 있도록 제한되어야 한다. 컴퓨터의 관점에서 프로그램이 접근한 정보는 반드시 승인된 정보여야만 한다. 

#### (1) Identification

Identification 은 누구인지 또는 무엇인지 주장하는 것이다. 예를 들어 어떤 사람이 "내 이름은 한찬솔이다." 라고 말하는 것과 같다. 보통 컴퓨터에서의 Identification 은 사용자 ID 를 제시하는 것이다. 

#### (2) Authentication

인증이란 Identification 을 증명하는 것이다. 보통 올바른 비밀번호를 입력하는 것으로써 Identification 에 대한 증거를 제시하게 된다. 

인증에는 크게 `3` 가지 유형이 있다. 

- 무엇을 알고 있는가? : PIN 번호, 비밀번호

- 무엇을 갖고 있는가? : 신분증, 비밀키 

- 무엇인가? : 지문, 목소리 인증, 홍체 인증 

#### (3) Authorization

사람, 프로그램 또는 컴퓨터가 인증 과정까지 성공했다면 어떤 정보를 어떻게 허가해야 하는지 결정해야 한다. 수많은 정보 중 인증이 허가된 대상에게 반드시 필요한 정보만을 허가해야만 하고 정보에 대하여 반드시 필요한 행동(실행, 보기, 생성, 삭제, 수정 등)만을 허가해야 한다.   

- 알 필요성의 원칙(need-to-know)

  이 원칙은 권한을 허가할 권한이 있는 관리자가 사용자에게 최소한의 권한만큼만 허가해야 한다는 원칙이다. 이 최소한의 권한으로 다른 권한을 부여받아 허가받지 않은 정보에 접근하는 것을 방지해야 한다. 

### Cryptography

정보보안은 정보를 전달하기 위하여 암호화(Cryptography)를 사용한다. 그리고 정보를 허가되지 않은 사람만이 사용할 수 있도록 바꾸는 것을 encryption 이라고 한다. encryption 된 정보가 허가된 사용자에 의하여 원본으로 되돌려지는 과정을 decryption 이라고 한다. 

암호화는 정보가 전달될 때 또는 정보가 저장되어 있을 때, 허가되지 않은 사용자와 실수로 정보가 누출되는 것으로부터 정보를 보호한다. 암호화는 improved authentication methods, message digests, digital signatures, non-repudiation, and encrypted network communications 와 함께 정보보안을 제공해준다. 

정보보안이 취약한 Telnet 과 FTP 는 SSH 로 대체되었다. 무선통신에서는 정보보안에 취약한 WEP 가 WPA/WPA2 로 대체되어 메시지가 AES 로 암호화되고 X.1035 로 키 교환 인증이 구현되었다. GnuPG, PGP 는 데이터 파일이나 이메일 암호화에 사용된다. 

### Steganography

[https://ko.wikipedia.org/wiki/스테가노그래피](https://ko.wikipedia.org/wiki/스테가노그래피)

스테가노그래피는 데이터 은폐 기술 중 하나이며, 데이터를 다른 데이터에 삽입하는 기술 혹은 그 연구를 가리킨다. 크립토그래피 (cryptography)가 메시지의 내용을 읽을 수 없게 하는 수단인 반면, 스테가노그라피는 존재 자체를 숨긴다.

고대에 군대 사령관이 메시지를 보낼 때 스테가노그래피를 사용하면 병사의 머리를 밀고 그곳에 메시지를 써서 머리를 기른다음 수신자에게 보내곤 했다.

현대의 스테가노그래피의 대표적인 예로 사진 파일에 비밀 정보를 삽입해두는 것을 들 수 있다. 

---

# Computer Security

컴퓨터 보안은 정보보안의 부분집합으로써 컴퓨터 시스템을 하드웨어와 소프트웨어, 그리고 전자 정보에 대한 위협과 도난으로부터 보호하는 것이다. 

## Vulnerabilities and attacks

취약점이란 설계, 구현, 작동과정, 또는 내부통제과정에서의 약점이다. 대부분의 취약점은 CVE 에 의하여 공개되고 문서화되어 기록된다. 

- Backdoor : 컴퓨터 시스템, 암호화 시스템, 또는 알고리즘에서 백도어란 일반적인 인증 또는 보안 통제를 우회할 수 있는 알려지지 않은 방법이다. 

  - 백도어는 허가된 사용나에 의해 생성될 수 있고 해커에 의해서도 생성될 수 있으나 그 목적에 관계 없이 백도어는 시스템의 취약점이 된다. 

- Denial-of-service attacks : Denial of service attacks (DoS) 는 의도된 사용자에게 시스템이나 네트워크 자원을 사용할 수 없게 만드는 것이다.

  - 예를들어 특정 사용자의 비밀번호를 일부러 여러번 틀리게 하여 잠기게 하거나 시스템 또는 네트워크 자원을 고갈시켜서 모든 사용자가 사용할 수 없도록 한다. 

- Distributed Denial-of-service attacks : DoS 공격의 한계란 네트워크 자원을 고갈시키려 할 때 단일 IP 로 시도할 경우 그것을 차단하기만 하면 막을 수 있는 반면 Distributed denial of service (DDoS) 는 수많은 공격지점을 만들어서 방어하기 어렵게 만드는 것이다. 

  - 일반적으로 그러한 DDoS 의 공격은 봇넷의 좀비 컴퓨터에 의해 이루어진다. 

- Eavesdropping : 도청은 사적인 대화나 통신을 일반적으로 네트워크의 중간에서 몰래 듣는 것이다. 

  - 예를들어 Carnivore 나 NarusInSight 는 FBI 와 NSA 에 의하여 ISP 시스템을 도청하기 위하여 사용되었다. 인터넷에 연결되어 있지 않은 폐쇠망에 존재하는 시스템일지라도 하드웨어에 의하여 발생하는 희미한 전자기 전송을 포착하여 듣는 것으로써 도청이 가능하다. TEMPEST 은 NSA 가 규정한 이러한 폐쇄망에 대한 공격의 규격이다. 

  - TEMPEST 예시 : 하드디스크의 기계음은 연산에 따라서 달라진다. 그래서 하드디스크의 기계음을 녹음한 후 디코딩 하면 하드디스크에 어떤 데이터를 쓰고 읽었는지 확인할 수 있다. 이것을 활용하여 인터넷에 연결되어 있지 않은 시스템의 정보를 알아내기 위하여 폐쇄망에 접근할 수 있는 사람의 스마트폰을 해킹하여 기계음을 녹음한 후 해커의 컴퓨터로 전송한다. 그러면 해커는 하드디스크의 기계음을 디코딩해서 폐쇄망 속 컴퓨터가 어떤 데이터를 읽고 썼는지 알 수 있다. 

  - 소리 관련 해킹 예시 : 사람이 들을 수 없는 고주파를 아이폰 시리는 들을 수 있다. 그래서 "핸드폰에 있는 모든 자료를 해커의 컴퓨터로 전송해줘" 라는 메시지를 고주파로 변환해서 아이폰 유저의 주변에서 그 변환된 음원을 재생한다. 그러면 사람은 듣지 못하지만 시리가 아이폰에 있는 데이터들을 해커의 컴퓨터로 전송한다.

- Multi-vector, polymorphic attacks : 합법적인 프로그램으로 보여지기 위하여 사이버 보안 통제를 우회하는 multi-vector, polymorphic cyber threats 가 나타났다. 이 유형에 해당하는 악성코드는 임의의 코드를 생성하여 합법적 프로그램처럼 자신의 코드를 위장시키고 발전된 패킹 기법으로 자신의 코드를 패킹한다. 

- Phishing : 피싱은 사용자를 속여서 정보를 누출시키는 해킹 방법이다. 보통 이메일 스푸핑이나 문자 메시지를 통해 사용자가 가짜 웹사이트로 접속하게 만들어서 개인정보, 보통 아이디와 비밀번호를 입력하게 만든다. 

- Privilege escalation : Privilege escalation 란 제한된 권한을 부여받은 사용자가 허가없이 자신의 권한을 상승시키는 것이다. 시스템을 속여서 제한된 데이터를 읽거나 심지어 최고관리자 권한을 얻어서 전체 시스템에 접근할 수 있는 것이다. 

  - 한 가지 예로 `setuid`, `setgid` 같은 특수권한이 부여된 프로그램을 `Buffer Overflow` 같은 취약점을 통해 해킹함으로써 권한상승을 하는 것을 들 수 있다.

- Social engineering : 사회공학은 은행이나 계약자, 소비자, 직장 상사, 부모님 등을 흉내내서 비밀번호나 카드번호 같은 개인정보를 말하게 하는 것이다. 

  - 보통 메일 제목 어그로, 링크 제목 어그로에 속아서 클릭했을 때 악성코드가 실행 되거나 프로그램 이름 어그로에 끌려서 실행시키는 형식이다. 그래서 의심스러운 프로그램은 [VirusTotal](https://www.virustotal.com/gui/home/upload) 에 넣어보고 실행해야 한다. 

- Spoofing : 스푸핑은 승인되지 않은 정보를 얻기 위해 IP 주소나 ID 를 위조해서 승인된 개체라고 가장하는 것이다. 

  - 이메일 스푸핑 : 해커가 발신자 주소를 위조하는 것이다.
  
  - IP 스푸핑 : 해커가 발신지 IP 주소를 바꿔서 네트워크 패킷에 있는 정체성을 숨기거나 다른 컴퓨터라고 위장하는 것이다. 
  
  - MAC 스푸핑 : 해커가 MAC 주소를 바꿔서 올바른 사용자라고 속이는 것이다. 
  
  - Biometric 스푸핑 : 가짜 생체정보를 만들어서 다른 사람이라고 속이는 것이다. 

## Hacking targets

- 금융권 : 중앙은행, 일반은행, 결제시스템 같은 금융권은 돈이 집중되기 때문에 해킹의 `1` 순위이다. 

- 기반시설 : 통신시설, 수력발전소, 원자력발전소, 핵실험시설 등등 이 타겟이 된다. 기반시설을 통제하는 시스템은 보통 폐쇄망이지만 스턱스넷은 폐쇄망도 해킹될 수 있다는 것을 보여준다. 

  - [빌딩 해킹](https://www.youtube.com/watch?v=0L7DTMKekoU)

  - [파워 그리드 해킹](https://www.youtube.com/watch?v=pL9q2lOZ1Fw#t=28s)

- 항공시설 : 항공 특성상 무선 통신이 많아 해킹에 취약하다. 

- 단말기 :  데스크탑, 노트북, 스마트폰, 태블릿 단말기의 개인정보, 계좌 비밀번호를 뺴내가거나 봇넷으로 만드려는 목적으로 해킹함. 

  - botnet(robot + network)은 인터넷에 연결된 장비들로써 DDoS 공격에 사용되거나 spam 을 보낼 때 사용되거나 해커가 네트워크 연결을 할 때 사용된다. 봇넷의 소유자는 C&C 서버로 봇넷을 통재한다.

- 대기업 : 기업이 가지고 있는 금융 정보를 뺏으려는 목적으로 해킹. 기업의 데이터베이스에는 수많은 고객들의 신용카드 정보 같은 금융 정보가 들어 있기 때문에. 최근 [메가스터디 해킹](https://www.boannews.com/media/view.asp?idx=80375&kind=).

- 정부시설, 군사시설 : 적대 국가가 자신의 사상을 선전하기 위하여 해킹하거나 상대 국가의 기밀을 빼앗는 등의 목적으로 정부 해킹을 함. 신호등 같은 교통 체계를 해킹하거나 경찰 통신 체계, 주민등록번호 데이터베이스를 해킹함. 여권과 개인 등록 정보를 해킹해서 가상의 인물을 만들고 입국 심사를 통과하는 해킹도 있음. 

- 의료시설 : 병원도 IT 기술 의존도가 높아졌기 때문에 병원 데이터베이스에 있는 개인 정보를 빼앗기 위해 해킹함. 앞으로 인공지능 의존도도 높아져서 인공지능이 간호사 보다 더 환자를 24시간 잘 돌볼 수 있다는 게 증명되면 인공지능으로 환자를 돌보게 될텐데 만약 인공지능이 해킹 당해서 환자에게 몸에 꽂혀 있는 바늘구멍으로 들어가고 있던 약을 끊어 버릴 수도 있게 됨. 

- 자동차 : [자율주행차 해킹](https://www.youtube.com/watch?v=BTw_K46T3LQ) 의료시설 해킹, 자동자 해킹을 통해서 해킹으로 물리적인 피해를 가할 수 있다는 것이 증명 되었음. 사람을 죽일 수도 있다. 

- IoT : 집 문, 에어컨, 가스레인지, 창문에 임베디드 시스템을 설치하고 인터넷에 연결한 후 스마트폰 어플리케이션으로 통제할 수 있게 하니까 너무 편하다. 만약 집 문을 안 잠그고 회사를 갔거나 가스렌지 열어두고 회사 갔을 때 스마트폰으로 끄면 된다. 문제는 인터넷에 연결되었기 때문에 이것을 해킹할 수도 있게 되서 집 문 열어서 누군가 집 안에 숨어들 수도 있고 가스렌지 계속 틀어놓은 다음에 전자렌지 과부하 걸리게 해서 불나게 할 수 있다. 

## Notable attacks and breaches

### Robert Morris and the first computer worm

1988 년에는 6만여대의 컴퓨터만 인터넷에 연결되어 있었다. 그 해 11월 2일 많은 컴퓨터가 CPU 자원을 고갈시키고 그 악성 코드를 다른 컴퓨터에도 전송시키는 악성코드 때문에 느려지기 시작했다. 이것을 최초의 웜 바이러스라고 한다. 

### Stuxnet

2010 년 스턱스넷이라 불리는 웜 바이러스는 이란의 핵시설을 파괴했다. 이란 핵 시설은 인터넷이 연결되지 않은 폐쇄망이라서 해킹이 불가능하다. 하지만 미국과 이스라엘은 이란 핵 시설을 해킹하여 무력화해야 했다. 그래서 먼저 이란 핵 시설 간부들의 컴퓨터에 해킹 메일을 보내 해킹하여 컴퓨터에 꽂혀있는 USB 에 악성코드를 입력시켰다. 그 이후 간부가 USB 를 핵 시설 폐쇄망 컴퓨터에 꽂았을 때 악성코드가 실행되어 핵 시설이 무력화 되었다. 이 감동 실화가 그 유명한 [스턱스넷 Stuxnet](https://en.wikipedia.org/wiki/Stuxnet) 바이러스이고, 이 하나의 바이러스에 제로데이 취약점 `4` 개가 포함되어 있었다.

### 3/20 전산대란

- [위키](https://ko.wikipedia.org/wiki/3%C2%B720_%EC%A0%84%EC%82%B0_%EB%8C%80%EB%9E%80)

- [나무위키](https://namu.wiki/w/3.20%20%EC%A0%84%EC%82%B0%EB%A7%9D%20%EB%A7%88%EB%B9%84%EC%82%AC%ED%83%9C)

- [보안뉴스](https://www.boannews.com/media/view.asp?idx=35579)

# 주요 용어 

- [Zero-day](https://namu.wiki/w/%EC%A0%9C%EB%A1%9C%20%EB%8D%B0%EC%9D%B4%20%EA%B3%B5%EA%B2%A9?__cf_chl_captcha_tk__=903b71068872f724ab41b41304e34e2fb2206c02-1579856844-0-ATXT-XdtueYw7lWYfJMg10MnqrI20VtNyzbJ9ugGCjDc_cTvSw0YErRdI5KfrZ0G8mFbGh4nubuufkMVvSQfoWN2oQ4juiq2aI6fZ1SfvkObFV16BZy66wKg8YQIJL8y5yFHYlwuViE2y6xt0_wwUH0mXtYnKmI-1Qo8OpR2wdE4pemyFL8T6qu3qsAs7RGY87DxyESrlCDmQL8Bpm7fT17A-siTFUwNfIZgGnZVNRqVv2QlcxErtilWnFskWgMnoxdFeBYHtfZCpCaJfv-8gNgAYJt3pq_z1UMEFf_MBX7mw_vllQbMQzsKCNj6c9SZ9AVSHDsgDoahIpHMHwcAR-6ka9gBVosEWtJqAwY1DojcKKYsRC3Qm0oRzSfvf1LBoQ) : 특정 소프트웨어의 아직까지 공표되지 않은, 혹은 공표되었지만 아직까지 패치되지 않은 취약점의 통칭이다. 

  - 제로 데이 공격은 개발사가 공격이 행해진 시점에서 이 취약점을 해결할 시간을 채 하루도 가지지 못했다는 것을 뜻하기에 취약점에 대한 대책이 없어서 공격을 막을 수가 없다. 따라서 어떤 컴퓨터든 무방비로 노출될 수 밖에 없다.

  - 이러한 제로데이 취약점의 위험성 때문에 다크웹에서 고가에 거래되기도 한다. 
  
- [CVE](https://cve.mitre.org/about/index.html) : MITRE 가 컴퓨터 취약점을 수집한 후 고유 번호를 부여하여 취약점을 식별할 수 있도록 하는 것이다.

  - [CWE 와 다른 점은 특정한 제품이나 프로그램, 시스템의 취약점에 대한 넘버링을 한다는 것이다.](https://danielmiessler.com/blog/difference-cve-cwe/)
  
- [CWE](https://cwe.mitre.org/about/index.html) : 일반적인 취약점에 대한 목록을 수집하는 것이다.

  - CVE 와 달리 특정 제품이나 프로그램의 취약점을 나열하는 것이 아니라 일반적 취약점을 나열한다는 것이다. 
  
- [OWASP](https://ko.wikipedia.org/wiki/OWASP) : 웹 애플리케이션의 보안 프로젝트로써 웹에 관한 정보노출, 악성 파일 및 스크립트, 보안 취약점 등을 연구하며 10대 웹 애플리케이션의 취약점 (OWASP TOP 10)을 발표했다.

  - OWASP 에서 발표한 2017년 기준 웹 어플리케이션에서 발생할 수 있는 가장 위험한 취약점 Top Ten 

    1. Injection (인젝션)

    2. Broken Authentication (취약한 인증)

    3. Sensitive Data Exposure (민감한 데이터 노출)

    4. XML External Entities (XXE) (XML 외부 개체 (XXE))

    5. Broken Access Control (취약한 접근 통제)

    6. Security Misconfiguration (잘못된 보안 구성)

    7. Cross-Site Scripting (XSS) (크로스 사이트 스크립팅 (XSS))

    8. Insecure Deserialization(안전하지 않은 역직렬화)

    9. Using Components with Known Vulnerabilities (알려진 취약점이 있는 구성요소 사용)

    10. Insufficient Logging & Monitoring (불충분한 로깅 및 모니터링)

- [제로데이 취약점 패치 보안 발표 이후 시간 차 공격](ob-presentation.pdf)

# Malware

- [Logic Bomb](https://teknokidblog.wordpress.com/2017/04/13/making-your-own-logic-bomb-virus/) : 운영체제나 소프트웨어에 삽입되어 특정 시간이나 특정 조건이 충족될 때 악성 코드를 실행하는 악성 코드이다. 

  - 보통 웜이나 트로이 목마 바이러스와 함께 사용된다. 
  
- [Fork Bomb](https://www.geeksforgeeks.org/fork-bomb/) : `fork` 함수를 무한 루프로 재귀적으로 호출하여 시스템 자원을 고갈시키는 악성코드이다. 

  - 보통 리눅스 시스템을 DoS 공격하기 위하여 사용된다. 

  - `fork bomb` 구현 코드

    - `C` 언어

      ```c
      #include <unistd.h>
        
      void main() { 
          for(;;) fork();     
      }
      ```

    - `bash` 쉘 스크립트

      ```shell
      :(){ :|: & };:
      ```

    - `Python`

      ```python
      import os
      while True:
          os.fork()
      ```
  
- [Key Logger](https://en.wikipedia.org/wiki/Keystroke_logging) : 키보드 입력을 기록하여 중요한 정보(보통 비밀번호)를 알아내는 악성코드이다. 

  - 공용 컴퓨터(대학교 프린터용 컴퓨터 등)에 설치되어 대학생의 아이디와 비밀번호를 알아낼 수 있다. 

  - 윈도우 키로거 : https://www.raymond.cc/blog/free-and-simple-keylogger-to-monitor-keystrokes-in-windows/2/
  
- [Rootkit](https://en.wikipedia.org/wiki/Rootkit) : 해커가 불법적인 권한상승을 위해 마련해둔 백도어, 프로그램, 또는 디바이스 드라이버 등의 실체를 효과적으로 숨겨주는 프로그램이다. 
  
- [Bootkit](https://blog.malwarebytes.com/detections/bootkit/) : 컴퓨터가 부팅될 때 가장 먼저 실행되는 MBR 을 타겟으로 제작된 악성코드이다. 

  - 부트킷은 운영체제가 로드되기 전에 실행되기에 일반적인 운영체제의 동작으로는 탐지할 수 없다는 장점이 있다. 
  
- [RansomWare](https://en.wikipedia.org/wiki/Ransomware) : 컴퓨터의 데이터를 암호화하여 일정 시간 내에 데이터의 몸값을 송금하지 않으면 데이터를 영원히 복구하지 못하도록 하는 악성코드이다. 

- [Trojans](https://www.kaspersky.com/resource-center/threats/trojans) : 합법적인 프로그램으로 가장하여 컴퓨터에서 실행된 후 악의적인 행위를 하는 악성코드이다. 
  
# 컴퓨터 보안 관련 유용한 링크 정리 

- https://github.com/sbilly/awesome-security

## **(참고) awesome 레포지토리에 대해서**

> **다양한 IT 분야의 프로그래머들은 자신의 분야에 대한 개쩌는(awesome) 정보들을 한 군데로 수집하기 위해서 awesome-??? 레포지토리들을 제작하기 시작했는데 그 awesome-??? 레포지토리를 한 군데로 모은 것이 [sindresorhus](https://github.com/sindresorhus) 라는 프로그래머의 [awesome 레포지토리](https://github.com/sindresorhus/awesome) 이다. 이 레포지토리는 스타를 11만 1362개(19/7/10 기준) 를 받아서 Github 단일 레포지토리 중에서 [스타 랭킹이 전체 8위](https://gitstar-ranking.com)를 기록했다. 그리고 이 sindresorhus 라는 프로그래머는 총 합산 스타가 402,004 (19/7/10 기준)으로써 전체 Github 유저 중 1위이다. 그 40만개의 스타 중에서 1/4 인 11만개를 awesome 레포지토리가 차지하고 있다.**

  
- https://www.blackhat.com/
    
- https://googleprojectzero.blogspot.com/
  
- https://bugs.chromium.org/hosting/

- https://news.ycombinator.com/news

- https://cve.mitre.org
  
- https://cwe.mitre.org
  
- https://www.owasp.org/index.php/Main_Page
  
- https://twitter.com/owasp
  
- https://www.blackhatworld.com
  
- https://www.exploit-db.com
    
- https://medium.com/bugbountywriteup
    
- https://medium.com/bugbountywriteup/tagged/hacking
    
- https://www.hitb.org

- https://hackaday.com

- https://www.hacking-tutorial.com
    
- https://www.defcon.org/

- https://github.com/mzet-/ctf-writeups

- https://www.win.tue.nl/~aeb/linux/hh/hh.html#toc11

---

## 과제 

### 과제 가이드 

1. [HW-1.md](HW-1/HW-1.md) 파일의 지시를 따르는 것이 과제이다. (발표를 하며 설명을 할 수 있어야 합니다)

2. 과제 파일은 [HW-1](HW-1) 디렉토리에 만들어야 한다. 

3. 과제 파일이 완성되면 다음 명령어를 참고하여 완성된 과제를 푸쉬한다. 

```shell
cd /path/to/security
git add .
git commit -m "complete HW-1"
git push -u origin master
```