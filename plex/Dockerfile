FROM ubuntu:16.04
# Installs the plexmediaserver (plexpass version) from the .deb downloaded from Plex
MAINTAINER Scott Hansen <firecat4153@gmail.com>

COPY ./start.sh /start.sh
RUN apt-get -q update && \
    apt-get install -qy \
        avahi-daemon \
        avahi-utils \
        wget && \
    wget https://downloads.plex.tv/plex-media-server/1.3.0.3059-6277334/plexmediaserver_1.3.0.3059-6277334_amd64.deb -O /plexmediaserver.deb && \
    dpkg -i /plexmediaserver.deb && \
    rm /plexmediaserver.deb && \
    chmod u+x /start.sh && \
    # Fixes a problem where avahi won't start inside the container
    sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf && \
    rm -rf /var/lib/apt/lists/*

VOLUME /config

EXPOSE 1900:1900/udp \
       5353:5353/udp \
       32400:32400 \
       32443:32443 \
       32463:32463 \
       32410:32410/udp \
       32412:32412/udp \
       32413:32413/udp \
       32414:32414/udp

CMD ["/start.sh"]
