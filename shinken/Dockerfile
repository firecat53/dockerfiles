FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SHINKEN_CONFIG /var/lib/shinken/.shinken.ini

COPY start.sh shinken-configure.sh /

RUN apt-get -q update && \
    apt-get install -qy \
        python-pycurl \
        python-cherrypy3 \
        python-setuptools \
        wget \
        nagios-plugins && \
    adduser --system --no-create-home --group shinken && \
    wget https://github.com/naparuba/shinken/tarball/master -O /shinken.tar.gz && \
    mkdir shinken-master && \
    tar zxf shinken.tar.gz -C shinken-master --strip-components=1 && \
    cd shinken-master && \
    python setup.py install && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists/*

VOLUME /etc/shinken /var/log/shinken /var/lib/shinken

CMD ["/start.sh"]
