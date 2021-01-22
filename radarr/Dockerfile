FROM ubuntu:20.04
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG arch=x64
ARG uid=1000
ARG gid=100
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl apt-transport-https ca-certificates mediainfo && \
    curl -O https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends dotnet-runtime-5.0 && \
    cd /opt && \
    curl -L -O $(curl -s https://api.github.com/repos/Radarr/Radarr/releases | \
        grep linux-core-$arch.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4) && \
    tar -xvzf Radarr.develop.*.linux-core-$arch.tar.gz && \
    rm Radarr.*gz && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    useradd --no-create-home -g users -u $uid radarr && \
    mkdir /config && \
    chown -R radarr:users /config /opt/Radarr && \
    apt-get autoremove -qy apt-transport-https && \
    rm -rf /var/lib/apt/lists

EXPOSE 7878
USER radarr
VOLUME ["/config"]

CMD ["/opt/Radarr/Radarr", "-nobrowser", "-data=/config"]
