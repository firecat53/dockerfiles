# Docker Check-MK Monitoring

This is a Dockerfile to set up [Check-MK Monitoring][1] along with
Msmtp send-only mail (using Gmail, Mandrill, etc.) for notifications.

## Build

1. Ensure the correct version from the [downloads page][2] is noted in the
Dockerfile. As of version 1.5.0, Check-MK requires a tmpfs so the container must
be run with either `--privileged` or `--cap-add SYS_ADMIN` with `--security-opt apparmor:unconfined`.

1. Build from Dockerfile:

        docker build -t check_mk .

1. Create data-only volume. Check-MK site configurations will be auto-generated in
/opt/omd/sites.

        docker create -v /opt/omd/sites -v /config --name check_mk_config myscratch true

1. Edit the msmtprc and msmtp-aliases files with your email SMTP info. Default
site/user is omd. Then:

        docker cp msmtprc check_mk_config:/config/
        docker cp msmtp-aliases check_mk_config:/config/

## Run

Systemd service file is also available. Make sure to run with the `--init` flag
to best manage the container shutdown process.

    docker run -d \
               --cap-add SYS_ADMIN \
               --volumes-from check_mk_config \
               -v /etc/localtime:/etc/localtime \
               -p 5000:5000 \
               --name check_mk_run \
               --init \
               check_mk

Be patient when starting (20-40 seconds). The site has to be generated
initially, then regenerated on subsequent runs to make sure all the permissions
and user/groups are correct. Existing site info will not be overwritten!

The default username is `cmkadmin`. The password is randomly set on initial site
creation. Find it with:

    docker logs check_mk_run | grep password

## Manage

The default site name is 'default'. You can use the omd commands to control that
site:

    $ docker exec -it check_mk_run /bin/bash
    # omd --help
    # omd su default
    OMD[default]:~$ ....

## Update

* Each site has to be updated to the new version while the old version is
  installed. Until I figure out how to automate this, it has to be done
  manually.

      $ docker exec -it check_mk_run /bin/bash
      # export VERSION=1.4.0p34
      # curl -o new_version.deb https://mathias-kettner.de/support/$VERSION/check-mk-raw-${VERSION}_0.bionic_amd64.deb
      # dpkg -i new_version.deb
      # omd stop <site name>
      # omd update <site name>
      
* Now update the Dockerfile and rebuild the image with the new version and
  restart check_mk.

[1]: http://mathias-kettner.com/check_mk.html  "Check-MK Monitoring"
[2]: http://mathias-kettner.com/check_mk_download.php?HTML=yes "downloads page" 
