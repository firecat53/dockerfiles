FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SABNZBD_USER sabnzbd
ENV UID 22000

COPY start.sh /start.sh
RUN gpg --keyserver keys.gnupg.net --recv-keys 4BB9F05F && \
    gpg --armor --export 4BB9F05F | apt-key add - && \
    echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu xenial main" >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get install -qy \
        sabnzbdplus \
        sabnzbdplus-theme-classic \
        sabnzbdplus-theme-mobile \
        sabnzbdplus-theme-plush \
        unrar && \
    useradd --no-create-home -g users --uid $UID $SABNZBD_USER && \
    chmod +x /start.sh && \
    rm -rf /var/lib/apt/lists/*

USER $SABNZBD_USER

CMD ["/start.sh"]
