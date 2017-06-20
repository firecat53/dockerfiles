FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV DELUGE_USER deluge
ENV UID 22000

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get install -qy wget \
                        openvpn \
                        unrar \
                        unzip \
                        deluged \
                        deluge-console \
                        deluge-web && \
    wget https://github.com/jpetazzo/pipework/raw/master/pipework -O /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework && \
    useradd --no-create-home -g users --uid $UID $DELUGE_USER && \
    apt-get -qy autoremove wget && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh pia_deluge_monitor /

CMD ["/start.sh"]
