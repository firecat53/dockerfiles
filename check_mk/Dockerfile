# Check_MK

FROM ubuntu:16.04
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV VERSION 1.4.0p7
ENV DEBIAN_FRONTEND noninteractive

COPY start.sh /start.sh
RUN apt-get update -q && \
    apt-get install -qy apache2 \
                        apache2-utils \
                        binutils \
                        curl \
                        debconf \
                        dialog \
                        dnsutils \
                        fping \
                        freeradius-utils \
                        graphviz \
                        lcab \
                        libdbi1 \
                        libevent-1.4-2 \
                        libffi6 \
                        libglib2.0-0 \
                        libgsf-1-114 \
                        libltdl7 \
                        libnet-snmp-perl \
                        libpango1.0-0 \
                        libpcap0.8 \
                        libperl5.22 \
                        libreadline5 \
                        libsnmp-perl \
                        libuuid1 \
                        libxml2 \
                        msmtp \
                        msmtp-mta \
                        patch \
                        php-cgi \
                        php-cli \
                        php-gd \
                        php-json \
                        php-mcrypt \
                        php-pear \
                        php-sqlite3 \
                        poppler-utils \
                        pyro \
                        rpcbind \
                        rpm \
                        rsync \
                        smbclient \
                        snmp \
                        time \
                        traceroute \
                        unzip \
                        wget \
                        xinetd && \
    wget https://mathias-kettner.de/support/$VERSION/check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    dpkg --unpack check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    sed -i 's/systemctl/#systemctl/' /var/lib/dpkg/info/check-mk-raw-1.4.0p7.postinst && \
    apt-get -f install && \
    rm check-mk-raw-${VERSION}_0.xenial_amd64.deb && \
    chmod +x /start.sh && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]
