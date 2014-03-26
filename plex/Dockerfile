FROM ubuntu
#Thanks to https://github.com/bydavy/docker-plex/blob/master/Dockerfile and https://github.com/aostanin/docker-plex/blob/master/Dockerfile. Adapted from https://github.com/timhaak/docker-plex
MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get -q update && apt-get install -qy --force-yes curl

RUN echo "deb http://shell.ninthgate.se/packages/debian squeeze main" > /etc/apt/sources.list.d/plexmediaserver.list

RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -

RUN apt-get -q update && apt-get install -qy --force-yes plexmediaserver

# Fixes a problem where avahi won't start inside the container
RUN sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ADD ./pipework /usr/bin/pipework
RUN chmod u+x /usr/bin/pipework

EXPOSE 32400

CMD ["/start.sh"]
