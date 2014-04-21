FROM ubuntu:saucy

MAINTAINER Scott Hansen firecat4153@gmail.com

# Install packages
# Current package version 3.6.3
RUN apt-get update && apt-get -qy install wget openjdk-7-jre-headless
RUN wget http://download.crashplan.com/installs/linux/install/CrashPlan/CrashPlan_3.6.3_Linux.tgz -O crashplan.tar.gz && \
	tar zxf crashplan.tar.gz && \
	rm crashplan.tar.gz
ADD crashplan-install.sh /crashplan-install.sh
ADD start.sh /start.sh
RUN chmod +x /crashplan-install.sh && chmod +x /start.sh
RUN /crashplan-install.sh

EXPOSE 4243

CMD ["/start.sh"]
