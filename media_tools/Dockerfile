FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get install -qy --force-yes \
    handbrake-cli \
    libav-tools \
    mediainfo \
    mkvtoolnix \
    par2 \
    ranger \
    rsync \
    unrar

ENTRYPOINT ["/bin/bash"]
