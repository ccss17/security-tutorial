# GBC (Ghost Base Camp) Security 

This is a repository containing the contents of GBC's 4th course, Security Course, which is being held for beginners at HGU computer security club, GHOST.

한동대학교 컴퓨터보안 동아리 **GHOST** 에서 신입기수를 대상으로 진행하는 **GBC** 의 `4` 번째 과정인 **보안** 과정을 진행하기 위한 내용을 담은 레포지토리입니다. 

## Contents

- Day 1 : [Base](1-Base/Base.md)

- Day 2 : [Computer Principle 1](2-Computer1/Principle1.md)

- Day 3 : [Computer Principle 2](3-Computer2/Principle2.md)

- Day 4 : [Reversing 1](4-Reversing1/Reversing1.md)

- Day 5 : [Reversing 2](5-Reversing2/Reversing2.md)

- Day 6 : [Exploit 1](6-Exploit1/Exploit1.md)

- Day 7 : [Exploit 2](7-Exploit2/Exploit2.md)

- Day 8 : [Exploit 3](8-Exploit3/Exploit3.md)

- Day 9 : [Exploit 4](9-Exploit4/Exploit4.md)

- Day 10 : [Pentest + Wrap-up](10-Pentesting/Pentesting.md)

## Helpful link

- **git** tutorial : https://nolboo.kim/blog/2013/10/06/github-for-beginner/

- **github** 

  - create repo : https://help.github.com/en/github/getting-started-with-github/create-a-repo

  - fork : https://help.github.com/en/github/getting-started-with-github/fork-a-repo

  - pull requests : https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request

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

1. 본인의 계정을 만들어야 합니다. 만약 `GHOSTER` 라는 아이디를 만들고 싶다고 하면 다음의 명령어들을 입력하면 됩니다

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

3. vim, tmux, gdb 세팅

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

- 앨런 튜링의 정지문제 증명과정 

- 16진법, 8진법, 2진법 표기법 

- **2-Computer/Principle1.md** CPU 레지스터 부분에 레지스터, RAM, HDD or SSD 의 계층구조 사진 추가 .
