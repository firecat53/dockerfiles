#
# Nginx Dockerfile
#
# Modified from https://github.com/dockerfile/nginx
#

# Pull base image.
FROM nginx:latest

COPY ./start.sh /start.sh
RUN chmod u+x /start.sh

# Add nginx.conf and proxy_params
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./proxy_params /etc/nginx/proxy_params

# Add vhosts
COPY ./sites-enabled /etc/nginx/sites-enabled

# Add nginx config files
COPY ./server.conf.d /etc/nginx/server.conf.d

# Remove existing files in conf.d
RUN rm etc/nginx/conf.d/*

# Add nginx server config files
COPY ./conf.d /etc/nginx/conf.d

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80 443

# Define default command.
CMD ["/start.sh"]
