FROM ubuntu:trusty
# Installs the plexmediaserver (plexpass version) from the .deb downloaded from Plex
MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get -q update && apt-get install -qy --force-yes avahi-daemon avahi-utils
ADD https://downloads.plex.tv/plex-media-server/0.9.10.1.585-f31034e/plexmediaserver_0.9.10.1.585-f31034e_amd64.deb /plexmediaserver.deb
RUN dpkg -i /plexmediaserver.deb
RUN rm /plexmediaserver.deb

# Fixes a problem where avahi won't start inside the container
RUN sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

VOLUME /config

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400:32400 32443:32443 1900:1900/udp 32463:32463 5353:5353/udp 32410:32410/udp 32412:32412/udp 32413:32413/udp 32414:32414/udp

CMD ["/start.sh"]
