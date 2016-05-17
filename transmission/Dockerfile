FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV TRANSMISSION_USER transmission
ENV UID 22000

COPY private/* /config_orig/
COPY start.sh pia_transmission_monitor config.ini /

RUN apt-get -q update && \
    apt-get install -qy wget \
                        openvpn \
                        transmission-daemon && \
    wget https://github.com/jpetazzo/pipework/raw/master/pipework -O /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework && \
    chmod u+x /start.sh && \
    chmod u+x /pia_transmission_monitor && \
    useradd --no-create-home -g users --uid $UID $TRANSMISSION_USER && \
    apt-get -qy remove wget && \
    rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]
