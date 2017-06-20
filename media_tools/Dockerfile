FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get install -qy --force-yes \
    handbrake-cli \
    libav-tools \
    mediainfo \
    mkvtoolnix \
    par2 \
    ranger \
    rsync \
    unrar \
    vim-tiny && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
