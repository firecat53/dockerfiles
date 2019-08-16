FROM alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN \
# Install dependencies
    apk add --no-cache nginx && \
# Remove (some of the) default nginx config
    rm -f /etc/nginx.conf && \
    rm -f /etc/nginx/conf.d/default.conf && \
    rm -rf /etc/nginx/sites-* && \
    rm -rf /var/log/nginx && \
    rm -rf /var/www/* && \
# Ensure nginx logs, even if the config has errors, are written to stderr
    rm /var/lib/nginx/logs && \
    mkdir -p /var/lib/nginx/logs && \
    ln -s /dev/stderr /var/lib/nginx/logs/error.log && \
    chown -R nobody:www-data /var/lib/nginx/ /var/log/ /var/tmp/ && \
# Create folder where the user hook into our default configs
    mkdir -p /etc/nginx/server.d/ && \
    mkdir -p /etc/nginx/location.d/ && \
# Create default nginx.pid location
    mkdir -p /run/nginx && \
    chown nobody:www-data /run/nginx

WORKDIR /var/www

ADD etc/ /etc/

USER nobody

VOLUME ["/run/nginx", \
        "/var/log/nginx", \
        "/var/tmp"]

EXPOSE 8080

ENTRYPOINT ["/usr/sbin/nginx"]
