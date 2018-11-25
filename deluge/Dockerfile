FROM ubuntu
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN apt-get update && \
    apt-get install -y deluged \
                       deluge-console \
                       deluge-web \
                       iproute2 \
                       libssl1.0.0 \
                       openssl \
                       p7zip \
                       unrar \
                       unzip && \
    apt-get install -y build-essential \
                       libssl-dev \
                       libffi-dev \
                       python-dev \
                       python-pip && \
    pip install --no-cache-dir -U crypto \
                                  incremental \
                                  mako \
                                  markupsafe \
                                  pyopenssl \
                                  service_identity \
                                  six \
                                  twisted \
                                  zope.interface && \
    apt-get purge -y build-essential \
                     libffi-dev \
                     libssl-dev \
                     python-dev \
                     python-pip && \
    apt-get --purge autoremove -y && \
    apt-get clean && \
    rm -rf /tmp/* \
           /var/lib/apt/lists/* \
           /var/tmp/* && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    useradd -m -d /config -g users -u $uid deluge && \
    echo "deluge:deluge" | chpasswd && \
    mkdir /data && \
    chown -R deluge:users /config /data

COPY start.sh /usr/local/bin/

USER deluge

VOLUME ["/config", "/data"]

CMD ["start.sh"]
