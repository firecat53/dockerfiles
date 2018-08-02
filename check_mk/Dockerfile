FROM ubuntu:18.04
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV VERSION 1.5.0
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy msmtp \
                        msmtp-mta \
                        wget && \
    wget -q https://mathias-kettner.de/support/$VERSION/check-mk-raw-${VERSION}_0.bionic_amd64.deb && \
    dpkg --unpack check-mk-raw-${VERSION}_0.bionic_amd64.deb && \
    sed -i 's/systemctl/#systemctl/' /var/lib/dpkg/info/check-mk-raw-${VERSION}.postinst && \
    apt-get -qyf install && \
    rm check-mk-raw-${VERSION}_0.bionic_amd64.deb && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists

COPY start.sh /usr/local/bin/start.sh
CMD ["start.sh"]
