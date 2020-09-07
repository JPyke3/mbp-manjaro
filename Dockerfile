FROM manjarolinux/base

MAINTAINER jpyke3

# Update System
RUN pacman -Syyu --noconfirm 

# Install manjaro-tools and depends
RUN pacman -S manjaro-tools-iso-git \ 
    manjaro-tools-base-git \
    manjaro-tools-yaml-git \ 
    manjaro-tools-pkg-git \
    base-devel \
    git \
    lsb-release --noconfirm

RUN mkdir ~/.config
RUN cp -r /etc/manjaro-tools ~/.config
RUN sed -i "s/# use_overlayfs=\"false\"/use_overlayfs=\"false\"/g" ~/.config/manjaro-tools/manjaro-tools.conf

# Clone the repository into container
RUN git clone https://github.com/JPyke3/mbp-manjaro ~/iso-profiles

RUN pacman-key --recv-key 2BA2DFA128BBD111034F7626C7833DB15753380A --keyserver keyserver.ubuntu.com
