#
# Nginx Dockerfile
#
# Modified from https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:trusty

# Install Nginx.
RUN apt-get update && apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# Add vhosts
ADD ./sites-enabled /etc/nginx/sites-enabled

# Add nginx config files
ADD ./server.conf.d /etc/nginx/server.conf.d

# Add nginx server config files
ADD ./conf.d /etc/nginx/conf.d

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80 443

# Define default command.
CMD ["/start.sh"]
