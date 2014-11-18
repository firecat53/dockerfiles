FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN gpg --keyserver keys.gnupg.net --recv-keys 4BB9F05F
RUN gpg --armor --export 4BB9F05F | apt-key add -
RUN echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu trusty main" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list
RUN apt-get -q update && apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush unrar

RUN useradd --no-create-home -g users --uid 22000 sabnzbd
USER sabnzbd

CMD ["sabnzbdplus", "-f", "/config"]
