FROM ubuntu:20.04
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ENV VERSION 2.0.0p3
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy msmtp \
                        msmtp-mta \
                        wget && \
    wget -q https://download.checkmk.com/checkmk/$VERSION/check-mk-raw-${VERSION}_0.focal_amd64.deb && \
    dpkg --unpack check-mk-raw-${VERSION}_0.focal_amd64.deb && \
    sed -i 's/systemctl/#systemctl/' /var/lib/dpkg/info/check-mk-raw-${VERSION}.postinst && \
    apt-get -qyf install && \
    rm check-mk-raw-${VERSION}_0.focal_amd64.deb && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists

COPY start.sh /usr/local/bin/start.sh
VOLUME ["/config", "/opt/omd/sites"]
CMD ["start.sh"]
