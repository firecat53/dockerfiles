FROM ubuntu:20.04
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN apt-get update && \
    apt-get install -y deluged \
                       deluge-console \
                       deluge-web \
                       iproute2 \
                       p7zip \
                       unrar \
                       unzip && \
    # Fix version 2.0.3 bug #3327
    sed -i "s/stack_info=False/*args, **kwargs/" /usr/lib/python3/dist-packages/deluge/log.py && \
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
