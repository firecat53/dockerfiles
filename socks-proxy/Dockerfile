FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG PUB_KEY
ARG SSHD_USER

# Install sshd
RUN apk --no-cache --no-progress add openssh shadow && \
    useradd --no-create-home --shell /sbin/nologin ${SSHD_USER:-proxy} && \
    echo "$SSHD_USER:$(date|md5sum)" | chpasswd && \
    sed -i 's/^\(#\)\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?AuthorizedKeysFile.*/AuthorizedKeysFile \/etc\/ssh\/%u/' /etc/ssh/sshd_config && \
    ssh-keygen -A && \
    echo "$PUB_KEY" > /etc/ssh/$SSHD_USER && \
    chown $SSHD_USER: /etc/ssh/$SSHD_USER && \
    chmod 600 /etc/ssh/$SSHD_USER && \
    rm -rf /tmp/*

ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
