FROM       ubuntu:18.04
MAINTAINER chansol0505@naver.com
RUN set -x \
    && apt -qq update \
    && apt -y -qq upgrade \
    && apt -y -qq install git build-essential xxd \
    && cd ~ \
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
    && rm -rf ~/dotfiles-cli ~/__MACOSX ~/challenges.zip ~/bombs.zip ~/bof \
    && cd ~ \
    && git clone -q https://github.com/ccss17/security-tutorial
CMD zsh