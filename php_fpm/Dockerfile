FROM php:fpm-alpine
RUN apk --no-cache add \
        build-base \
        freetype \
        freetype-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        libpng \
        libpng-dev && \
    nproc=$(getconf _NPROCESSORS_ONLN) && \
    docker-php-ext-install -j${nproc} gd && \
    apk del build-base freetype-dev libjpeg-turbo-dev libpng-dev
