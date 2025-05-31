# Docker PrivateBin source

This Dockerfile downloads the most recent release of PrivateBin from Github and
extracts the static files to /var/www/ and the PHP files to /srv. These are
copied to Docker volumes `privatebin-static` and `privatebin-data` for serving up by
ngxinx/php-fpm images.

## Usage and/or updating

        ./update.sh
        
Update conf.php with desired options:

    docker run -it --rm -v privatebin-data:/srv alpine vi /srv/cfg/conf.php
