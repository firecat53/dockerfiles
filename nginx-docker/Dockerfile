#
# Nginx Dockerfile
#
# Modified from https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:precise

# Install Nginx.
RUN apt-get update && apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update && apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# Add vhosts (ansible will add the ADD lines here)

# Add nginx config files
ADD ./ssl.conf /etc/nginx/server.conf.d/ssh.conf
ADD ./http-https.conf /etc/nginx/server.conf.d/http-https.conf

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80 443

# Define default command.
CMD ["/start.sh"]
