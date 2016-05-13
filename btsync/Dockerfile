FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ARG BTSYNC_USER=btsync
ENV BTSYNC_USER ${BTSYNC_USER}
ARG UID=2200
ENV UID ${UID}

RUN apt-get update && \
    apt-get install -qy wget && \
    useradd -m -g users --uid $UID $BTSYNC_USER && \
    wget https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz -O /home/$BTSYNC_USER/btsync.tar.gz && \
    tar -xzf /home/$BTSYNC_USER/btsync.tar.gz -C /home/$BTSYNC_USER && \
    rm /home/$BTSYNC_USER/btsync.tar.gz && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists/*

USER $BTSYNC_USER
WORKDIR /home/$BTSYNC_USER

CMD ["./btsync", "--nodaemon", "--webui.listen", "0.0.0.0:8888"]
