# GBC (Ghost Base Camp) Security 

This is a repository containing the contents of GBC's 4th course, Security Course, which is being held for beginners at HGU computer security club, GHOST.

한동대학교 컴퓨터보안 동아리 **GHOST** 에서 신입기수를 대상으로 진행하는 **GBC** 의 `4` 번째 과정인 **보안** 과정을 진행하기 위한 내용을 담은 레포지토리입니다. 

*보안 과정은 다음과 같이 **10일** 과정으로 구성되며 독자가 **C 언어** 를 잘 알고 있다고 가정합니다.*

## Contents

- Day 1 : [Base](01-Base/readme.md)

- Day 2 : [Computer Principle 1](02-Computer1/readme.md)

- Day 3 : [Computer Principle 2](03-Computer2/readme.md)

- Day 4 : [Reversing 1](04-Reversing1/readme.md)

- Day 5 : [Reversing 2](05-Reversing2/readme.md)

- Day 6 : [Exploit 1](06-Exploit1/readme.md)

- Day 7 : [Exploit 2](07-Exploit2/readme.md)

- Day 8 : [Exploit 3](08-Exploit3/readme.md)

- Day 9 : [Exploit 4](09-Exploit4/readme.md)

- Day 10 : [Pentest + Wrap-up](10-Pentesting/readme.md)

## Helpful link

- **git** tutorial : https://nolboo.kim/blog/2013/10/06/github-for-beginner/

- **github** 

  - create repo : https://help.github.com/en/github/getting-started-with-github/create-a-repo

  - fork : https://help.github.com/en/github/getting-started-with-github/fork-a-repo

  - pull requests : https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request

  - 깃 사용법 및 풀리퀘스트 튜토리얼 한글버전 : https://wayhome25.github.io/git/2017/07/08/git-first-pull-request-story/

- **Markdown** Cheatsheet : https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

## Groundwork

### 1. Create repo

- https://github.com 에 가입하고 이 레포지토리를 fork 한다. 그리고 다음 명령어를 참고하여 자신의 컴퓨터에 fork 한 레포지토리를 clone 한다. 

    ```shell
    $ git clone https://github.com/{GITHUB_ID}/security-tutorial
    ```

### 2. Server account configuration 

#### Connect server

- ssh 고스트 서버 : gbc@ghostogether.club

  - MacOS/Unix-like : `$ ssh gbc@ghostogether.club`
  
  - Windows : https://puttytray.goeswhere.com/download/putty.exe 에서 putty 를 실행해서 ssh 접속

    - putty simple usage : https://sifaserdarozen.wordpress.com/2014/10/24/simple-usage-of-putty-and-pscp/

#### Create server account

1. 본인의 계정을 만들어야 합니다. 만약 `GHOSTER` 라는 아이디를 만들고 싶다고 하면 다음의 명령어들을 입력하면 됩니다. __다음 스크립트의 `GHOSTER` 를 본인의 아이디로 모두 치환하여 입력하세요.__

  ```shell
  # 유저 생성 
  sudo useradd -m -d /home/GHOSTER -s $(which bash) GHOSTER
  # 비밀번호 지정 
  sudo passwd GHOSTER 
  # sudo 명령어를 쓸 수 있는 권한 부여 
  sudo visudo # vim 이 열리면 GHOSTER ALL=(ALL:ALL) ALL 을 추가한다. 
  ```

2. 로그아웃 후 만들어진 계정으로 재접속합니다. `gbc` 가 아니라 **자신의 계정**으로 접속해야 합니다. 

  ```shell
  exit
  ssh GHOSTER@ghostogether.club
  ```

3. vim, tmux, gdb 세팅을 하기 위해 다음 명령어들을 입력하세요. 

  ```shell
  # vim, tmux, gdb 세팅
  git clone https://github.com/ccss17/dotfiles-cli
  cd dotfiles-cli
  ./install.sh # 다음 프롬프트가 출력되면 'y' 입력 후 비밀번호 입력 
  # Do you want to change your default shell to zsh? [Y/n]
  # Changing the shell...
  # Password:
  ./install_pwndbg.sh
  ```

  - 끝났습니다. 세팅 된 환경을 적용하기 위해서는 단순히 재접속하면 됩니다.

## Rule

GBC 참여자들은 **PASS** 와 **FAIL** 에 관련된 내용이니 [GBC 보안 룰](RULE.md)을 꼭 확인해주세요. 

## TODO

- 괴델의 불완전성의 정리의 증명과정 

- 32비트 시스템에서 인자전달 방식 

- `call` 부터 함수 인트로 아웃트로 시각적으로 설명 

- vanilla-gdb, pwndbg, tmux 시각적으로 설명 

- Git 설치 Git 초기설정 - git config --global user.name "" git config --global user.email "" Git pull requests 메뉴얼 Git init/status/add/commit/push/remote 의 가장 기초적인 사용법 