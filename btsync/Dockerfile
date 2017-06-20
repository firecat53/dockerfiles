FROM ubuntu:16.04

LABEL "Mainainer"="Scott Hansen <firecat4153@gmail.com>"

ENV BTSYNC_USER btsync
ENV UID 22000

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
