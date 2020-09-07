# mbp-manjaro Dockerfile
# Author: github.com/JPyke3 <Jacob Pyke, pyke.jacob1@gmail.com>

FROM manjarolinux/base

MAINTAINER jpyke3

# Update System
RUN [ "pacman", "-Syyu", "--noconfirm" ]

# Install manjaro-tools and depends
RUN [ "pacman", "-S", "manjaro-tools-iso-git",\ 
    "manjaro-tools-base-git",\
    "manjaro-tools-yaml-git",\
    "manjaro-tools-pkg-git",\
    "base-devel",\
    "git",\
    "lsb-release",\
    "--noconfirm" ]

# Import my Pacman GPG key
RUN [ "pacman-key", "--recv-key", "2BA2DFA128BBD111034F7626C7833DB15753380A", "--keyserver", "keyserver.ubuntu.com" ]

COPY docker-commands.sh /scripts/docker-commands.sh

RUN ["chmod", "+x", "/scripts/docker-commands.sh"]

ENTRYPOINT [ "/scripts/docker-commands.sh" ] 
