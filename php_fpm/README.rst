Docker PHP-FPM
==============

This Dockerfile builds the `Docker Library`_ php-fpm image (php:5-fpm) with gd,
mcrypt and iconv support.

Build
-----

Build from Dockerfile::

	docker build -rm -t php_fpm . 

Run
___

Make sure to include the volume from the nginx container that contains the php files::

    docker run -d --name php_fpm_run -volumes-from nginx_run php_fpm


Usage
-----

Example link from an nginx container.

    docker run -d -p 80:80 -p 443:443 --link php_fpm_run -v /srv:/srv -v /etc/localtime:/etc/localtime:ro --name nginx_run nginx

.. _Docker Library: https://hub.docker.com/_/php/
