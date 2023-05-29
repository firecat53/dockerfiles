FROM alpine:3.18
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG uid=1000
ARG gid=100
ARG UNRAR_VERSION=6.2.2

ENV HOME="/config" XDG_CONFIG_HOME="/config" XDG_DATA_HOME="/config"

RUN apk --no-cache add --virtual run-required \
                       geoip \
                       libtorrent-rasterbar \
                       p7zip \
                       qt5-qtbase \
                       python3 \
                       unzip && \
    apk --no-cache add --virtual build \
                       autoconf \
                       automake \
                       boost-dev \
                       build-base \
                       cmake \
                       curl \
                       git \
                       icu-dev \
                       libtool \
                       libtorrent-rasterbar-dev \
                       linux-headers \
                       openssl-dev \
                       perl \
                       pkgconf \
                       python3-dev \
                       qt5-qtbase-dev \
                       qt5-qtsvg-dev \
                       qt5-qttools-dev \
                       re2c \
                       zlib-dev && \
    # Compile Ninja
    git clone --shallow-submodules --recurse-submodules https://github.com/ninja-build/ninja.git ~/ninja && \
	cd ~/ninja && \
	git checkout "$(git tag -l --sort=-v:refname "v*" | head -n 1)" && \
	cmake -Wno-dev -B build \
		-D CMAKE_CXX_STANDARD=17 \
		-D CMAKE_INSTALL_PREFIX="/usr/local" && \
	cmake --build build && \
	cmake --install build && \
	# Compile qbittorrent
	git clone --shallow-submodules --recurse-submodules https://github.com/qbittorrent/qBittorrent.git ~/qbittorrent && \
	cd ~/qbittorrent && \
    # Checkout latest non-beta/alpha or rc version
    git checkout "$(git tag -l --sort=-v:refname | grep -v 'rc\|beta\|alpha' | head -n1)" && \
	cmake -Wno-dev -G Ninja -B build \
		-D CMAKE_BUILD_TYPE="release" \
		-D CMAKE_CXX_STANDARD=17 \
		-D CMAKE_INSTALL_PREFIX="/usr/local" \
        -D STACKTRACE=off \
		-D GUI=off && \
	cmake --build build && \
	cmake --install build && \
	# Build unrar
	cd && \
    wget -q -O - "https://www.rarlab.com/rar/unrarsrc-$UNRAR_VERSION.tar.gz" | tar zx && \
    cd unrar && \
    make && \
    make install && \
    cd && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -Dh /config -G users -u $uid qbittorrent && \
    echo "qbittorrent:qbittorrent" | chpasswd && \
    mkdir /data && \
    chown -R qbittorrent:users /config /data && \
	# Cleanup
	rm -rf ~/qbittorrent ~/ninja ~/unrar && \
    rm /usr/local/bin/ninja && \
	apk del build 

COPY start.sh /usr/local/bin/
COPY qBittorrent.conf /usr/local/share/qBittorrent/

USER qbittorrent
WORKDIR /config

VOLUME ["/config", "/data"]

CMD ["start.sh"]
