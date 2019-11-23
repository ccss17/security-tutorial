# 익스플로잇 (1)

## 리버싱이 어떻게 실전에서 쓰이는지

우리가 지금까지 했던 건 비밀번호를 알아내는 역공학이었다. 그 역공학 과정은 이러했다. 

1. **목표** : 비밀번호를 체크하는 분기 확인 

2. **과정** : 그 분기를 결정하는 조건 역추적

3. **해킹** : 분기를 결정하는 조건들을 이해한 후 분기를 조작하기 

이 리버싱 과정이 **목표** 만 달라질 뿐 여러가지 상황에서 적용된다. 

https://youtu.be/6JmkmmJ4qgU?t=192

https://youtu.be/li08Tw9MjZI?t=83

    1. ATM 기에서 돈이 인출되는 분기를 확인한다.

    2. 그 분기를 결정하는 조건을 역추적한다.

    3. 분기를 결정하는 조건을 이해하면 해킹할 수 있다. 

여러분들도 이론적으로는 이런 해킹들을 할 수 있게 된 거죠! 물론 실제로 하려면 좀 더 복잡한 소프트웨어 구조를 다룰 수 있는 숙련도가 있어야 하겠지만. 

## Android Reversing

### APKPure

https://apkpure.com/

https://apk-dl.com/

스마트 캠퍼스 검색 후 apk 다운로드 

### unzip

윈도우에서는 그냥 압축 풀기 맥 또는 리눅스에서는 `unzip 스마트캠퍼스.zip`

#### 폴더별로 살펴보기 

https://www.evilsocket.net/2017/04/27/Android-Applications-Reversing-101/

##### 중요 포인트

\assets\www\assets\images\card\hgu-logo.png

\assets\www\service-worker.js

###### unminify

\assets\www\build\main.js

https://beautifier.io 로 unminify

###### 몇 가지 정보 

- https://hisnet.handong.edu/api/scampus/popupZoneApi.php?key_value=hisnet_pupupzone_2601508

- 팝업존 이미지 및 정보

  - https:\/\/hisnet.handong.edu\/upload\/popup_zone\/1544685765795020.JPG

  - 라인 448 (unminify main.js) 

- 여기에 버스 탈 때 찍는 QR 코드 생성 알고리즘도 다 있을듯. 

- 루트 URL 정보

  - 라인 5037 (unminify main.js) 



## Web Reversing

### 소스 보기

### 파라미터 

http://hisnet.handong.edu/myboard/down.php?Board=B0031&id=21&fidx=2&filename=%BF%B5%BE%EE%B9%E8%C4%A1%B0%ED%BB%E7%C0%E7%C7%D0%BB%FD%B8%ED%B4%DC.xlsx

### 게시판 크롤

```python
import requests as rq
from bs4 import BeautifulSoup as bs

url = 'http://hisnet.handong.edu/for_professor/_load_bbs_notice.php?bname='
b = 'B0022'

def fd(prefix, i):
    if i < 10:
        digit = '000'+repr(i)
    elif i < 100:
        digit = '00'+repr(i)
    elif i < 1000:
        digit = '0'+repr(i)
    return prefix+digit

for i in range(100):
    table = fd('B', i)
    soup = bs(rq.get('http://hisnet.handong.edu/for_professor/_load_bbs_notice.php?bname='+table).text, 'html.parser')
    if 'ociexecute' not in soup.text:
        print(table)
```

---

## 과제 

### 과제 가이드 

1. 자신의 **security** 디렉토리에 HW-6 디렉토리를 만든다. 

2. [HW-6.md](HW-6.md) 을 다운받아서 HW-6 디렉토리에 저장한다. 

3. HW-6.md 파일의 지시를 따르는 것이 과제이다. 

4. 다 했으면 다음 명령어를 참고해서 커밋 후 푸쉬한다.

5. 월요일에 발표할 수 있을 정도로 과제를 해와야 한다. 

```shell
cd /path/to/security
git add .
git commit -m "complete HW6!!!"
git push -u origin master
```