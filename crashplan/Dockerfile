FROM ubuntu:trusty
# Crashplan is actually installed to a data-only container. You must run
# crashplan-install.sh before running this container.

MAINTAINER Scott Hansen firecat4153@gmail.com

RUN apt-get update && apt-get -qy install wget openjdk-7-jre-headless
ADD start.sh /start.sh
ADD crashplan-install.sh /crashplan-install.sh
RUN chmod +x /start.sh && chmod +x /crashplan-install.sh

EXPOSE 4243 4242

CMD ["/start.sh"]
