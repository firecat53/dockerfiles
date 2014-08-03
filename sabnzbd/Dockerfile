FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list

RUN apt-get -q update && apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush

VOLUME /config

EXPOSE 8080 9090

CMD ["sabnzbdplus", "-f", "/config"]
