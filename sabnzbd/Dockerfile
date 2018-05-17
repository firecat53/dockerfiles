FROM ubuntu

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -qy software-properties-common && \
    add-apt-repository -yn ppa:jcfp/nobetas && \
    add-apt-repository -y ppa:jcfp/sab-addons && \
    apt-get install -qy \
        ca-certificates \
        locales \
        par2-tbb \
        python-sabyenc \
        sabnzbdplus \
        unrar \
        unzip && \
    useradd --no-create-home -g users -u $uid sabnzbd && \
    locale-gen en_US.UTF-8 en_US && \
    apt-get autoremove -qy software-properties-common

COPY start.sh /usr/local/bin/

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
EXPOSE 8080

USER sabnzbd

CMD ["start.sh"]
