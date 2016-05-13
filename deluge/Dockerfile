FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DELUGE_USER deluge
ENV UID 22000

COPY private/openvpn /config_orig/openvpn
COPY private/deluge /config_orig/deluge
COPY ./start.sh /start.sh
COPY ./pia_deluge_monitor /pia_deluge_monitor
COPY ./config.ini /config.ini

RUN apt-get -q update && \
    apt-get install -qy wget \
                        openvpn \
                        deluged \
                        deluge-console \
                        deluge-web && \
    wget https://github.com/jpetazzo/pipework/raw/master/pipework -O /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework && \
    chmod u+x /start.sh && \
    chmod u+x /pia_deluge_monitor && \
    useradd --no-create-home -g users --uid $UID $DELUGE_USER && \
    apt-get -qy remove wget && \
    rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]
