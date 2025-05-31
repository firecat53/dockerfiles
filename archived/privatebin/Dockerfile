FROM alpine:3.18

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN \
# Install dependencies (nginx only installed temporarily then is removed again)
    apk add --no-cache curl gnupg rsync && \
# Get latest release
    tag=$(curl -sX GET "https://api.github.com/repos/PrivateBin/PrivateBin/releases/latest" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') && \
# Install PrivateBin
    export GNUPGHOME="$(mktemp -d)" && \
    gpg2 --list-public-keys || /bin/true && \
    curl -s https://privatebin.info/key/release.asc | gpg2 --import - && \
    cd /tmp && \
    curl -Ls https://github.com/PrivateBin/PrivateBin/releases/download/${tag}/PrivateBin-${tag}.tar.gz.asc > PrivateBin-${tag}.tar.gz.asc && \
    curl -Ls https://github.com/PrivateBin/PrivateBin/archive/${tag}.tar.gz > PrivateBin-${tag}.tar.gz && \
    gpg2 --verify PrivateBin-${tag}.tar.gz.asc && \
    mkdir -p /var/www/ && \
    cd /var/www && \
    tar -xzf /tmp/PrivateBin-${tag}.tar.gz --strip 1 && \
    rm *.md && \
    mv cfg/conf.sample.php cfg/conf.php && \
    mv cfg lib tpl vendor /srv && \
    mkdir -p /srv/data && \
    sed -i "s#define('PATH', '');#define('PATH', '/srv/privatebin/');#" index.php && \
    chown -R nobody: /var/www /srv/* && \
# Cleanup
    rm -rf "${GNUPGHOME}" /tmp/* && \
    apk del --no-cache curl gnupg
