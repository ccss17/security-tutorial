# GBC 과제 1 

---
## CVE란 무엇인가
- **CVE : 'Common Vulnerabilities and Exposure' 의 약자로 정보 보안 취약점 표준 코드를 뜻한다**

  - **알려진 취약점을 식별하는 방식을 표준화하는 데 목적이 있는 코드이다**
  - **최근 2년 내에 발견 된 CVE 2가지 예시**
    - > CVE-2019-0797(Win32k 권한 상승 취약점) : Kaspersky 보안 업체를 통해 보고된 해당 취약점은 Windows 8.1, Windows 10, Windows Server 2012, Windows Server 2012 R2, Windows Server 2016, Windows Server 2019 운영 체제 환경에서 Win32k 구성 요소가 메모리에서 적절하게 객체 처리를 하지 못하여 권한 상승이 발생하는 취약점이다
    
    - > CVE-2019-0808(Win32k 권한 상승 취약점) : Google 업체를 통해 보고된 Windows 7, Windows Server 2008 운영 체제 환경에서 Win32k 구성 요소가 메모리에서 적절하게 객체 처리를 하지 못하여 권한 상승이 발생하는 취약점이다.
   
    - 위의 두가지 모두 해당 취약점 공격에 성공할 경우 커널 모드로 임의의 코드 실행이 가능하다. 이를 통해 공격자는 프로그램 설치, 데이터 보기, 변경 및 삭제가 가능하며 새로운 사용자 계정을 생성할 수 있다.

    - 해당 Win32k 권한 상승 취약점은 Chrome 취약점과 함께 실제 FruityArmor, SandCat 공격 그룹에서 사이버 공격에 사용되었던 것으로 알려져 있기 때문에 Windows 운영 체제 사용자는 반드시 2019년 3월에 배포된 정기 보안 업데이트를 통해 최신 패치를 적용해야 한다.

    - CVE ID 예시

          ![image-CVE](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2370933D54CAF55936)