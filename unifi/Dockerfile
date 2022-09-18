FROM ubuntu:20.04

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -qy wget && \
    echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list && \
    wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg && \
    apt-get update && \
    apt-get install -qy \
	        openjdk-8-jre-headless \
            unifi && \
    bash -c 'mkdir -p /config/{data,logs,run}' && \
    bash -c 'rmdir /var/lib/unifi /var/log/unifi /var/run/unifi' && \
    bash -c 'ln -s /config/data /var/lib/unifi' && \
    bash -c 'ln -s /config/logs /var/log/unifi' && \
    bash -c 'ln -s /config/run /var/run/unifi' && \
    chown -R unifi:unifi /config /usr/lib/unifi /var/lib/unifi /var/log/unifi /var/run/unifi && \
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
