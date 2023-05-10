FROM alpine:3.18
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG PUB_KEY
ARG SSHD_USER=proxy

# Install sshd
RUN apk --no-cache --no-progress add openssh shadow && \
    useradd --no-create-home --shell /sbin/nologin ${SSHD_USER} && \
    pass=$(date|md5sum) && \
    echo -e "${pass}\n${pass}" | passwd ${SSHD_USER} && \
    sed -i 's/^\(#\)\?AllowTcpForwarding.*/AllowTcpForwarding yes/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?AuthorizedKeysFile.*/AuthorizedKeysFile \/etc\/ssh\/%u/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?TCPKeepAlive.*/TCPKeepAlive yes/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?ClientAliveInterval.*/ClientAliveInterval 30/' /etc/ssh/sshd_config && \
    sed -i 's/^\(#\)\?ClientAliveCountMax.*/ClientAliveCountMax 1000/' /etc/ssh/sshd_config && \
    ssh-keygen -A && \
    echo "$PUB_KEY" > /etc/ssh/$SSHD_USER && \
    chown $SSHD_USER: /etc/ssh/$SSHD_USER && \
    chmod 600 /etc/ssh/$SSHD_USER && \
    rm -rf /tmp/*

ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
