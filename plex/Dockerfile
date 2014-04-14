FROM ubuntu:precise
# Installs the plexmediaserver (plexpass version) from the .deb downloaded to the build directory
# Because the plexpass version has to be downloaded from the forums while logged in.
MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get -q update && apt-get install -qy --force-yes unzip avahi-daemon avahi-utils
ADD plexmediaserver_0.9.9.10.458-008ea34_amd64.deb /plexmediaserver.deb
RUN dpkg -i /plexmediaserver.deb
RUN rm /plexmediaserver.deb

ADD https://github.com/jpetazzo/pipework/archive/master.zip /pipework.zip
RUN unzip pipework.zip && rm pipework.zip && cp pipework-master/pipework /usr/bin/pipework && chmod u+x /usr/bin/pipework

# Fixes a problem where avahi won't start inside the container
RUN sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

VOLUME /config

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

CMD ["/start.sh"]

