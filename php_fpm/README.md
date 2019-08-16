# Docker PHP-FPM

This Dockerfile builds a php-fpm image with iconv, json, gd and opcache support.
To add additional PHP modules, add the appropriate [Alpine Linux][1] packages to
the Dockerfile before building. Error and access logs are written to stdout for
consumption by `docker logs`. Container runs as user `nobody` so ensure proper
permissions are set on files in the data volumes. The container is designed to
share the network space of the running nginx container so it is not necessary to
open any ports on this container.

## Build

Build from Dockerfile

	docker build -t php_fpm .

## Run

Mount volumes for static and dynamic data to /var/www/xxx and/or /srv/xxx. Add
volume mounts for additional subdirectories/projects. Container can be run in
`--read-only` mode for some additional security.

Example:

    docker run -d \
           --name php_fpm_run \
           --net container:nginx_run \
           --read-only \
           -v /etc/localtime:/etc/locatime:ro \
           -v privatebin-data:/srv/privatebin \
           -v privatebin-static:/var/www/privatebin:ro \
           php_fpm
    
[1]: https://pkgs.alpinelinux.org/packages
