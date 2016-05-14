* An assorted collection of Dockerfiles, mostly designed for home server/lab
  use. Build/run instructions are in each subdirectory. Bold items are ones that
  I currently use. Others could potentially be out of date. Docker-gen and its
  Let's Encrypt companion are git submodules. To update the submodules::

      git submodule update --remote
  
  - Btsync
  - Check-MK (Monitoring system based on Nagios. Lighter than OMD)
  - Crashplan
  - **Couchpotato**
  - **Deluge** (with OpenVPN client and privateinternetaccess.com script)
  - `**Docker_Gen**`_ (Auto-generate Nginx reverse-proxy template)
  - `**Docker Let's Encrypt Proxy Companion**`_ (auto-generate and renew SSL certs)
  - **Gollum** personal Wiki
  - Headphones
  - **Lazy Librarian**
  - **Media tools** (collection of common tools for working with media files)
  - **OMD** (Open Monitoring Distribution. Pre-configured Nagios with Check_Mk plugin, et. al.)
  - **Plex**
  - **Rsync** (used for backing up Docker data-only volumes)
  - **Sabnzbd**
  - **Samba**
  - Shinken (Nagios-compatible server monitoring)
  - **Sickbeard**
  - **Stringer** (Web-based RSS Reader)
  - **Syncthing**
  - Transmission (with OpenVPN client and privateinternetaccess.com script)

* The standard UID:GID for the containers that don't run as root is 22000:100. Make sure to update UID/GID as necessary if you have shared data and need it to be easily accessible between containers/host
* MIT License

.. _**Docker_Gen**: https://github.com/jwilder/docker-gen
.. _**Docker Let's Encrypt Proxy Companion**: https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
