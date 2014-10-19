FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get install -qy --force-yes python-pycurl python-cherrypy3 python-setuptools python-pip nagios-plugins
RUN adduser --system --no-create-home --group shinken
ADD master.tar.gz /
RUN cd /shinken-master && python setup.py install
ADD start.sh /start.sh
ADD shinken-configure.sh /shinken-configure.sh

VOLUME /etc/shinken /var/log/shinken /var/lib/shinken
ENV SHINKEN_CONFIG /var/lib/shinken/.shinken.ini

CMD ["/start.sh"]
