# Docker PHP-FPM

This Dockerfile builds the [Docker Library][1] php-fpm image (php:fpm-alpine)
with added gd support. `iconv` support is already included in the php:fpm-alpine
image and mcrypt is apparently no longer recommended and is not supported by the
`docker-php-ext-install` command.

## Build

Build from Dockerfile

	docker build -t php_fpm .

## Run

Make sure to include the volume from the nginx container that contains the php files

    docker run -d --name php_fpm_run --volumes-from nginx_run php_fpm

[1]: https://hub.docker.com/_/php/
