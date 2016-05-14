# Open Monitoring Distribution

FROM debian:jessie
MAINTAINER Scott Hansen, firecat4153@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Install OMD
COPY start.sh /start.sh
RUN gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7 && \
    gpg --armor --export F8C1CA08A57B9ED7 | apt-key add - && \
    echo "deb http://labs.consol.de/repo/stable/debian jessie main" >> /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get install -qy omd && \
    apt-get install -qy msmtp msmtp-mta heirloom-mailx && \
    chmod +x /start.sh && \
    rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]
