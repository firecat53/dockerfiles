# Check_MK

FROM ubuntu:16.04
MAINTAINER Scott Hansen, firecat4153@gmail.com

ENV VERSION 1.2.8p1
ENV DEBIAN_FRONTEND noninteractive

COPY start.sh /start.sh
RUN apt-get update -q && \
    apt-get install -qy gdebi-core \
                        wget \
                        msmtp \
                        msmtp-mta \
                        heirloom-mailx && \
    wget https://mathias-kettner.de/support/$VERSION/check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    gdebi -nq check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    rm check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    chmod +x /start.sh && \
    apt-get autoremove -qy gdebi-core \
                           wget && \
    rm -rf /var/lib/apt/lists/* && \

CMD ["/start.sh"]
