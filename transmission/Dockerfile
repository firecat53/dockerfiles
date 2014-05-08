FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get -q update && apt-get install -qy --force-yes unzip openvpn software-properties-common transmission-daemon

ADD https://github.com/jpetazzo/pipework/archive/master.zip /pipework.zip
RUN unzip pipework.zip && rm pipework.zip && cp pipework-master/pipework /usr/bin/pipework && chmod u+x /usr/bin/pipework

ADD private/openvpn /config_orig/openvpn
ADD private/transmission /config_orig/transmission
ADD private/pia_transmission_monitor /config_orig/pia_transmission_monitor
ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh
ADD ./pia_transmission_monitor /pia_transmission_monitor
RUN chmod u+x  /pia_transmission_monitor
ADD ./config.ini /config.ini

CMD ["/start.sh"]
