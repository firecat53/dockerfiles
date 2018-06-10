# Docker Samba

This is a Dockerfile to set up a Samba 4 server.

## Build

    docker build -t samba .

The initialize.sh script creates the data-only volume if necessary, adds the
smb.conf file and a users.txt file if desired. Edit the smb.conf file as you
like (make sure to add any shares). Make sure you accurately obtain the UID and
GID (for the `users` group) for each user if they already exist on the host
server, or you will have permissions problems later. The users.txt file should
be formatted like::

    user1 UID1 GID1 password1
    user2 UID2 GID2 password2
    ....

Then run

    ./initialze.sh

I strongly recommend deleting users.txt from the current directory after it gets
copied into the data-only volume as it contains passwords in plain text!

## Run

Systemd service file is available if desired. Otherwise::

    docker run -d -p 445:445 -p 139:139 -p 138:138/udp -p 137:137/udp \
        --volumes-from samba_config\
        -h <your server hostname> \
        -v /etc/localtime:/etc/localtime:ro
        ## The next 3 lines are just examples of mounting different folders
        ## and/or volumes to be used as shares
        -v /home:/home \
        -v /mnt/media:/mnt/media \
        -v /mnt/downloads:/data\
        --name samba_run samba

## Manage

To add new users or update the smb.conf, edit or recreate those files in the
working directory, then run::

    ./initialze.sh

Note that this completely replaces existing users/smb.conf. If you just want to
add a user without re-creating users.txt or smb.conf, use docker exec to enter
the running container and then edit /config/users.txt or /config/smb.conf. Those
changes will be saved and used when the container is restarted.
