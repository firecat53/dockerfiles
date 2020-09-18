FROM ubuntu:20.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -qy wget && \
    echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list && \
    wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg && \
    apt-get update && \
    apt-get install -qy \
	        openjdk-8-jre-headless \
            unifi && \
    bash -c 'mkdir -p /config/{data,logs,run}' && \
    bash -c 'ln -s /config/* /usr/lib/unifi/' && \
    chown -R unifi:unifi /config /usr/lib/unifi && \
    apt-get autoremove -qy wget && \
    apt-get clean && \
    rm -rf /tmp/* \
           /var/lib/apt/lists/* \
           /var/tmp/*

USER unifi
VOLUME /config
WORKDIR /usr/lib/unifi

EXPOSE 3478/udp 6789 8080 8443 8880 8843 10001/udp

ENTRYPOINT ["java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
