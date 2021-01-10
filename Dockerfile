FROM ubuntu:20.10
RUN set -xe \
    && apt -qq update \
    && apt -y -qq upgrade \
    && apt -y -qq install apt-utils tzdata locales 
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
     && echo $TZ > /etc/timezone
RUN set -xe &&\
    dpkg-reconfigure --frontend=noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yes | unminimize
RUN set -xe \ 
    && apt -qq update --fix-missing && apt -y -qq upgrade
RUN apt -y -qq install vim tmux perl wget tar man sudo 
RUN apt -y -qq adduser netstat-nat net-tools curl w3m git build-essential xxd file make 
RUN apt -y -qq python3-pip zlib1g libjpeg8-dev zlib1g-dev 
RUN apt -y -qq libcurses-perl nyancat sl python 
RUN set -xe \ 
    && useradd -m -p "\$6\$ZEHyOJAy\$697kSQRpVsSnvU4oDl6BtR1LDrHltFPoqvdMJd9Bc0Msfz./iExfCcm7fxt7ZBzOKxAFCpdaj7aTzayT1L.pf/" -s /usr/bin/zsh ccsss \
    && usermod -aG sudo ccsss \
    && echo "ccsss ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ccsss \
    && chmod 0440 /etc/sudoers.d/ccsss
RUN set -xe \ 
    && cd \
    # asciiquarium
    && wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz \
    && tar -zxvf Term-Animation-2.4.tar.gz \
    && cd Term-Animation-2.4/ \
    && perl Makefile.PL && make && make test \
    && make install \
    && cd \
    && wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz \
    && tar -zxvf asciiquarium.tar.gz \
    && cd asciiquarium_1.1/ \
    && chmod +x asciiquarium \
    && cp asciiquarium /usr/local/bin/ \
    # ChristBASHTree 
    && cd \
    && wget -d -c -O /usr/local/bin/ChristBASHTree "https://raw.githubusercontent.com/sergiolepore/ChristBASHTree/master/tree-EN.sh" \
    && chmod +x /usr/local/bin/ChristBASHTree \
    # unimatrix
    && wget https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -O /usr/local/bin/unimatrix \
    && chmod a+rx /usr/local/bin/unimatrix \
    # pipes.sh 
    && cd \
    && git clone https://github.com/pipeseroni/pipes.sh \
    && cd pipes.sh \
    && make install \
    # Python Packages 
    && pip3 install YuleLog numpy colorama \
    && git clone -q https://github.com/ccss17/bof \
    && cd bof \
    && ./setup.sh \
    && rm -rf ~/bof

USER ccsss:ccsss
WORKDIR /home/ccsss

RUN cd ~ \
    && git clone -q https://github.com/ccss17/dotfiles-cli \
    && cd dotfiles-cli \
    && ./install.sh \
    && ./install_reversing.sh \
    && cd ~ \
    && wget http://security.cs.rpi.edu/courses/binexp-spring2015/lectures/2/challenges.zip \
    && unzip challenges.zip \
    && mv challenges crackme \
    && wget http://security.cs.rpi.edu/courses/binexp-spring2015/lectures/3/bombs.zip \
    && unzip bombs.zip \
    && chmod +x ~/bombs/bomb \
    && git clone -q https://github.com/ccss17/bof \
    && cd bof \
    && ./setup.sh \
    && rm -rf ~/__MACOSX ~/challenges.zip ~/bombs.zip ~/bof \
    && cd ~ \
    && git clone -q https://github.com/ccss17/security-tutorial

CMD /usr/bin/zsh
