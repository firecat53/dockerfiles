# Bitwarden_RS

I would typically build my own image from the source Dockerfiles, but the build
process for this container involves a number of other images, including the web
vault image and a Musl based Rust image, that are difficult and time consuming to
build on my hardware. Therefore, in this case I'm going to choose to trust the
Bitwarden developers on the security of the bitwardenrs/server image.

## Configure

To set permissions correctly on the `bitwarden_data` data volume, the container
must first be run as root to generate the files, then a chown to the appropriate
user performed before the container can be run as user. This doesn't seem to
work the same as the other containers I run using data volumes and I don't know
why.

    docker run --name bitwarden_run --mount type=volume,source=bitwarden_data,target=/data --init --rm -d bitwardenrs:alpine
    docker exec -it bitwarden_run chown -R 1000:100 /data
    docker stop bitwarden_run
    
## Run

    docker run -d \
               --rm \
               -u $(id -u):$(id -g) \
               --mount type=volume,source=bitwarden_data,target=/data \
               -e ROCKET_PORT=8080 \
               -p 8080:8080 \
               --name bitwarden_run \
               --init \
               bitwardenrs/server:alpine
               
## Backups

Build an image containing sqlite:

    docker build -f Dockerfile.backup -t bwbackup .

This command creates a backup file 'db.sqlite3' in <path/to/local/backups> using
the sqlite built-in `.backup` command to ensure database consistency. Add a
`--user` directive if desired. The command below assumes data is stored in the
`bitwarden_data` volume. 

    docker run --user $(id -u):$(id -g) \
               -v bitwarden_data:/data \
               -v <path/to/local/backups>:/mnt \
               bwbackup \
               sqlite3 /data/db.sqlite3 ".backup /mnt/db.sqlite3"
