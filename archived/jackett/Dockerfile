FROM ubuntu:22.04
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG uid=1000
ARG gid=100
ARG DEBIAN_FRONTEND=noninteractive
ENV XDG_CONFIG_HOME=/config

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl libicu70 && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    useradd --no-create-home -g users -u $uid jackett && \
    mkdir -p /opt/Jackett /config && \
    tag=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -o \
        /tmp/jacket.tar.gz -L \
        https://github.com/Jackett/Jackett/releases/download/$tag/Jackett.Binaries.LinuxAMDx64.tar.gz && \
    tar xf /tmp/jacket.tar.gz -C /opt/Jackett --strip-components=1 && \
    chown -R jackett:users /opt/Jackett /config && \
    apt-get autoremove -qy curl && \
    rm -rf /var/lib/apt/lists

EXPOSE 9117
USER jackett
VOLUME ["/config", "/data/"]
WORKDIR /config

CMD ["/opt/Jackett/jackett", "--NoUpdates"]
