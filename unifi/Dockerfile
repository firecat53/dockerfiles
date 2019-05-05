FROM ubuntu:18.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG UNIFI_BRANCH="stable"
ARG UNIFI_VERSION
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -qy gnupg && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" > /etc/apt/sources.list.d/mongo.list && \
    apt-get update && \
    apt-get install -qy \
	        binutils \
            curl \
            jsvc \
            libcap2 \
            mongodb-org=3.4.20 \
            mongodb-org-mongos=3.4.20 \
            mongodb-org-server=3.4.20 \
            mongodb-org-shell=3.4.20 \
            mongodb-org-tools=3.4.20 \
            openjdk-8-jre-headless \
            wget && \
    if [ -z ${UNIFI_VERSION+x} ]; then \
        UNIFI_VERSION=$(curl -sX GET http://dl-origin.ubnt.com/unifi/debian/dists/${UNIFI_BRANCH}/ubiquiti/binary-amd64/Packages \
        |grep -A 7 -m 1 'Package: unifi' \
        | awk -F ': ' '/Version/{print $2;exit}' \
        | awk -F '-' '{print $1}'); \
    fi && \
    curl -o /tmp/unifi.deb -L "http://dl.ubnt.com/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb" && \
    dpkg -i /tmp/unifi.deb && \
    bash -c 'mkdir -p /config/{data,logs,run}' && \
    bash -c 'ln -s /config/* /usr/lib/unifi/' && \
    chown -R unifi:unifi /config /usr/lib/unifi && \
    apt-get autoremove -qy gnupg && \
    apt-get clean && \
    rm -rf /tmp/* \
           /var/lib/apt/lists/* \
           /var/tmp/*

USER unifi
VOLUME /config
WORKDIR /usr/lib/unifi

EXPOSE 3478/udp 6789 8080 8443 8880 8843 10001/udp

ENTRYPOINT ["java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
