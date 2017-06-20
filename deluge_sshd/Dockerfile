FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV DELUGE_SSHD_USER deluge
ENV UID 22000

RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get install -qy wget \
                        ca-certificates \
                        openvpn \
                        openssh-server \
                        unrar \
                        unzip \
                        deluged \
                        deluge-console \
                        deluge-web && \
    wget https://github.com/jpetazzo/pipework/raw/master/pipework -O /usr/bin/pipework && \
    chmod u+x /usr/bin/pipework && \
    useradd --no-create-home --shell /usr/sbin/nologin -g users --uid $UID $DELUGE_SSHD_USER && \
    sed -i 's/^\(#\)\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?AuthorizedKeysFile.*/AuthorizedKeysFile \/etc\/ssh\/%u/' /etc/ssh/sshd_config && \
    apt-get -qy autoremove wget && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh pia_deluge_monitor /

CMD ["/start.sh"]
