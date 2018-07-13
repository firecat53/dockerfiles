# Docker btrbk

Simple Dockerfile to install the latest btrbk (as packaged in the Alpine
repositories) in an image. Used for system backups.

## Build

    # docker build -t btrbk .

## Usage

* Btrfs root volumes mounted at /mnt/data_root and /mnt/root_root. Backup
  directory in /mnt/backup/btrbk_homeserver.

    # docker run --rm --cap-add SYS_ADMIN \
      -v /etc/btrbk.conf:/etc/btrbk.conf \
      -v /mnt/root_root:/mnt/root_root:ro \
      -v /mnt/data_root:/mnt/data_root:ro \
      -v /mnt/backup/btrbk_homeserver:/mnt/backup/btrbk_homeserver \
      btrbk \
      btrbk run -c /etc/btrbk.conf -v dryrun
