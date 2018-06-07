FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add curl mono && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -h /config -D -G users -u $uid jackett && \
    chown -R jackett:users /config && \
    mkdir -p /opt/Jackett && \
    tag=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -o \
        /tmp/jacket.tar.gz -L \
        https://github.com/Jackett/Jackett/releases/download/$tag/Jackett.Binaries.Mono.tar.gz && \
    tar xf /tmp/jacket.tar.gz -C /opt/Jackett --strip-components=1 && \
    rm -rf /tmp/*

EXPOSE 9117
USER jackett
VOLUME ["/config", "/data/"]
WORKDIR /config

CMD ["mono", "/opt/Jackett/JackettConsole.exe", "--NoUpdates"]
