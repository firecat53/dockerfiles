FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV TRANSMISSION_USER transmission
ENV UID 22000

RUN apt-get -q update && \
    apt-get install -qy wget \
                        openvpn \
                        python \
                        transmission-daemon && \
    wget https://github.com/jpetazzo/pipework/raw/master/pipework -O /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework && \
    useradd --no-create-home -g users --uid $UID $TRANSMISSION_USER && \
    apt-get -qy autoremove wget && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh pia_transmission_monitor /

CMD ["/start.sh"]
