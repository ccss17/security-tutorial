# GBC (Ghost Base Camp) Security 

## Groundwork

### Helpful link

- **git** tutorial : https://nolboo.kim/blog/2013/10/06/github-for-beginner/

- **github** 

  - create repo : https://help.github.com/en/github/getting-started-with-github/create-a-repo

  - fork : https://help.github.com/en/github/getting-started-with-github/fork-a-repo

  - pull requests : https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request

- **Markdown** Cheatsheet : https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

### 1. Create repo

- https://github.com 에 가입하고 이 레포지토리를 fork 한다. 그리고 다음 명령어를 참고하여 자신의 컴퓨터에 fork 한 레포지토리를 clone 한다. 

    ```shell
    $ git clone https://github.com/{GITHUB_ID}/security-tutorial
    ```

### 2. Server acount configuration 

#### Connect server

- ssh 고스트 서버 : gbc@ghostogether.club

  - MacOS/Unix-like : `$ ssh gbc@ghostogether.club`
  
  - Windows : https://puttytray.goeswhere.com/download/putty.exe 에서 putty 를 실행해서 ssh 접속

    - putty simple usage : https://sifaserdarozen.wordpress.com/2014/10/24/simple-usage-of-putty-and-pscp/

#### Create server account

1. `CCSSS` 라는 아이디를 만들고 싶다고 하면 다음의 명령어들을 입력

  ```shell
  # 유저 생성 
  $ sudo useradd -m -d /home/CCSSS -s $(which bash) CCSSS
  # 비밀번호 지정 
  sudo passwd CCSSS 
  # sudo 명령어를 쓸 수 있는 권한 부여 
  sudo visudo # vim 이 열리면 CCSSS ALL=(ALL:ALL) ALL 을 추가한다. 
  ```

2. 로그아웃 후 만들어진 계정으로 재접속

  ```shell
  exit
  ssh CCSSS@ghostogether.club
  ```

3. vim, tmux, gdb 세팅

  ```shell
  # vim, tmux, gdb 세팅
  git clone https://github.com/ccss17/dotfiles-cli
  cd dotfiles-cli
  ./install.sh 
  ./install_gdb.sh
  # 실행 후 비밀번호를 물어보면 비밀번호 입력 
  # "Do you want to change your default shell to zsh? [Y/n]" 가 뜨면
  # 프롬프트에 Y 입력 후 비밀 번호 입력 그리고 쉘이 뜨면 exit 입력 
  ```

  - 모두 다 완료된 후 세팅 된 환경을 적용하기 위해서 재접속

---

## Contents

1. [Base](1-Base/Base.md)

2. [Computer Principle 1](2-Computer1/Principle1.md)

3. [Computer Principle 2 + Reversing 1](3-Computer2+Reversing1/Principle2+Reversing1.md)

4. [Reversing 2](4-Reversing2/Reversing2.md)

5. [Reversing 3](5-Reversing3/Reversing3.md)

6. [Exploit 1](6-Exploit1/Exploit1.md)

7. [Exploit 2](7-Exploit2/Exploit2.md)

8. [Exploit 3](8-Exploit3/Exploit3.md)

9. [Exploit 4](9-Exploit4/Exploit4.md)

10. [Pentest + Wrap-up](10-Pentesting/Pentesting.md)

---

## Rule

1. 3번 결석하면 **Fail** 입니다. 

2. 2번 지각하면 1번 결석이 됩니다. 

3. 과제 제출은 본인의 **security-tutorial** 레포지토리에 **markdown** 형식의 문서(.md 파일) 로 **commit**하고 **push** 한 후 공지한 시간까지 **pull requests** 하는 것 입니다. 

4. 과제는 협동해서 해도 됩니다.

5. 10일 간 부여되는 10개의 과제 중 7개 이상을 PASS 하면 **GBC Security** PASS 를 할 수 있습니다.
