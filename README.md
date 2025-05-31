An ~~assorted~~ shrinking (thanks, NixOS!) collection of Dockerfiles, mostly
designed for home server/lab use. Build/run instructions are in each
subdirectory. I prefer when possible to build my own Docker images rather than
pull images build by someone else. The only exceptions are `official` images
that are vetted by Docker and the Plex image.

  - QBittorrent
  - Socks-proxy (ssh server for use as a SOCKS proxy to the Wireguard-client container)
  - Wireguard-client (Wireguard client to be used by other containers)

Archived and not tested anymore:

  - Check_mk
  - Couchpotato
  - Deluge
  - Gollum personal Wiki
  - Headphones
  - Jackett
  - Lazy Librarian
  - Media tools (collection of common tools for working with media files)
  - Miniflux (Web-based RSS Reader)
  - Nginx (works with php_fpm for serving PHP directories)
  - OpenVPN-client-pia (OpenVPN for PIA with port forwarding. Not working after
    their Next-gen server upgrade 2020/10)
  - PHP-FPM (works with Nginx)
  - Plex (Only using the official Plex Docker image now.)
  - Privatebin
  - Radarr
  - Rsync (used for backing up Docker data-only volumes)
  - Sabnzbd
  - Samba
  - Searx (simplified version only for intranet or local use)
  - Sonarr
  - Stringer (Web-based RSS Reader)
  - Syncthing
  - Syncthing Discovery server
  - Traefik (Configuration notes for the official Traefik image.)
  - Transmission
  - Unifi Controller
  - Vaultwarden (Instructions for building vaultwarden/server)
  - Yopass

* MIT License
