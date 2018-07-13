# Docker btrbk

Simple Dockerfile to install the latest btrbk (as packaged in the Alpine
repositories) in an image. Used for system backups.

## Build

    # docker build -t btrbk .

## Usage

* Btrfs root volumes mounted at /mnt/data_root and /mnt/root_root. Backup
  directories in /mnt/backup/. Set a lockfile to avoid conflicts, especially
  with frequest snapshots/backups.

    # docker run --rm \
      --cap-add SYS_ADMIN \
      -v /etc/btrbk.conf:/etc/btrbk.conf:ro \
      -v /etc/localtime:/etc/localtime:ro \
      -v /mnt/root_root:/mnt/root_root \
      -v /mnt/data_root:/mnt/data_root \
      -v /mnt/backup/:/mnt/backup/ \
      --name btrbk_run \
      btrbk \
      btrbk -c /etc/btrbk.conf -v dryrun
