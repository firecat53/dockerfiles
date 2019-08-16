#!/usr/bin/env sh
docker build -qt privatebin .
docker run --rm -v privatebin-static:/mnt \
    privatebin sh -c "rsync -aq --delete /var/www/ /mnt/ && \
                      chown -R nobody: /mnt/"
docker run --rm -v privatebin-data:/mnt \
    privatebin sh -c "rsync -aq --delete --exclude '/data' /srv/ /mnt/ && \
                      mkdir -p /mnt/data && \
                      chown -R nobody: /mnt/"
