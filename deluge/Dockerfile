FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get -q update && \
    apt-get install -qy unzip openvpn \
        software-properties-common \
        deluged deluge-console deluge-web 

ADD https://github.com/jpetazzo/pipework/archive/master.zip /pipework.zip
RUN unzip pipework.zip && \
    rm pipework.zip && \
    cp pipework-master/pipework /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework

COPY private/openvpn /config_orig/openvpn
COPY private/deluge /config_orig/deluge
COPY ./start.sh /start.sh
RUN chmod u+x /start.sh
COPY ./pia_deluge_monitor /pia_deluge_monitor
RUN chmod u+x /pia_deluge_monitor
COPY ./config.ini /config.ini

ENV DELUGE_USER deluge
ENV UID 22000
RUN useradd --no-create-home -g users --uid $UID $DELUGE_USER

CMD ["/start.sh"]
