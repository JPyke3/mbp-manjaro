# mbp-manjaro Dockerfile
# Author: github.com/JPyke3 <Jacob Pyke, pyke.jacob1@gmail.com>

FROM manjarolinux/base

MAINTAINER jpyke3

# Update System
RUN [ "pacman", "-Syu", "manjaro-tools-iso-git",\ 
    "manjaro-tools-base-git",\
    "manjaro-tools-yaml-git",\
    "manjaro-tools-pkg-git",\
    "base-devel",\
    "git",\
    "lsb-release",\
    "--noconfirm" ]

# Import my Pacman GPG key
RUN [ "pacman-key", "--recv-key", "2BA2DFA128BBD111034F7626C7833DB15753380A", "--keyserver", "keyserver.ubuntu.com" ]

# Clone the repository to the root home dir
RUN [ "git", "clone", "https://github.com/JPyke3/mbp-manjaro", "/root/iso-profiles"]

ENTRYPOINT buildiso -f -p $EDITION -k $KERNEL -t /root/out 
