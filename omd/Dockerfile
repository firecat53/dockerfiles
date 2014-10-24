# Open Monitoring Distribution

FROM ubuntu:trusty
MAINTAINER Scott Hansen, firecat4153@gmail.com

# Install OMD
RUN gpg --keyserver keys.gnupg.net --recv-keys F8C1CA08A57B9ED7
RUN gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -
RUN echo "deb http://labs.consol.de/repo/stable/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y omd
RUN apt-get install -y msmtp msmtp-mta heirloom-mailx

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
