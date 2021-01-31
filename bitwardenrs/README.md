# Bitwarden_RS

Instructions for building the bitwarden_rs web vault and bitwarden_rs server
From the Dockerfiles in https://github.com/dani-garcia/bw_web_builds and https://github.com/dani-garcia/bitwarden_rs. 

## Build

1. Download both the above repositories.
2. Update the node version in bw_web_builds/Dockerfile to 14:
        
        cd bw_web_builds
        sed -i 's/^FROM node:.*/FROM node:14-buster as build/' Dockerfile
        docker build -t bw_vault .

3. In bitwarden_rs/Dockerfile (adjust the symlink for your build architechture),
   change the web vault image to your locally built image:
  
        cd bitwarden_rs
        sed -i 's/^FROM bitwardenrs\/web-vault.*/FROM bw_vault:latest as vault' Dockerfile
        docker build -t bitwarden .

## Configure

To set permissions correctly on the `bitwarden_data` data volume, the container
must first be run as root to generate the files, then a chown to the appropriate
user performed before the container can be run as user. This doesn't seem to
work the same as the other containers I run using data volumes and I don't know
why.

    docker run --name bitwarden_run --mount type=volume,source=bitwarden_data,target=/data --init --rm -d bitwarden
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
               bitwarden
               
## Sqlite Backups

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
