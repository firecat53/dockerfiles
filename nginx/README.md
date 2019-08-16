# Docker Nginx

This Dockerfile builds a minimal nginx image designed to be used alongside a
php-fpm container and behind a reverse proxy (for SSL termination, etc.). Error
and access logs are written to stdout for consumption by `docker logs`.
Container runs as user `nobody` so ensure proper permissions are set on files in
the data volumes. The default port is set to port 8080 to allow running as user
instead of root. Add additional server blocks into etc/nginx/sites-available as
desired. Also add symlinks in sites-enabled. The default server block is setup
for php-fpm.

## Build

Build from Dockerfile

	docker build -t nginx .

## Run

Mount volumes for static data to /var/www/xxx. Add volume mounts for additional
subdirectories/projects.  Container can be run in `--read-only` mode for some
additional security.

Example:

    docker run -d \
           --name nginx_run \
           -p 8080:8080 \
           --read-only \
           -v /etc/localtime:/etc/locatime:ro \
           -v privatebin-static:/var/www/privatebin:ro \
           nginx
