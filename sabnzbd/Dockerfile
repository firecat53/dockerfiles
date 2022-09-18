FROM ubuntu:22.04

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG uid=1000
ARG gid=100
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -qy software-properties-common && \
    add-apt-repository -yn ppa:jcfp/nobetas && \
    add-apt-repository -y ppa:jcfp/sab-addons && \
    apt-get install -qy \
        ca-certificates \
        locales \
        sabnzbdplus \
        unrar \
        unzip && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            groupmod -g $gid users && \
    useradd --no-create-home -g users -u $uid sabnzbd && \
    mkdir /config && \
    chown -R sabnzbd:users /config && \
    locale-gen en_US.UTF-8 en_US && \
    apt-get autoremove -qy software-properties-common && \
    rm -rf /var/lib/apt/lists

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
EXPOSE 8080

USER sabnzbd
VOLUME /config

CMD ["sabnzbdplus", "--server", "0.0.0.0:8080", "--config-file", "/config/"]
