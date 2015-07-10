* An assorted collection of Dockerfiles, mostly designed for home server/lab use. Build/run instructions are in each subdirectory. Bold items are ones that I currently use. Others could potentially be out of date.
  
  - Ansible-base (base image to be able to provision via Ansible)
  - Btsync
  - **Couchpotato**
  - **Gollum** personal Wiki
  - Headphones
  - **Lazy Librarian**
  - **Media tools** (collection of common tools for working with media files)
  - **Nginx-ansible** (Ansible playbook for semi-automatically setting up Nginx reverse proxy to the containers)
  - **OMD** (Open Monitoring Distribution. Pre-configured Nagios with Check_Mk plugin, et. al.)
  - **Plex**
  - **Rdiff-backup** (used for `backing up data-only volumes`_)
  - **Sabnzbd**
  - **Samba**
  - Shinken (Nagios-compatible server monitoring)
  - **Sickbeard**
  - **Stringer** (Web-based RSS Reader)
  - **Syncthing**
  - **Transmission** (with OpenVPN client and privateinternetaccess.com script)

* The standard UID:GID for the containers that don't run as root is 22000:100. Make sure to update UID/GID as necessary if you have shared data and need it to be easily accessible between containers/host
* MIT License

.. _backing up data-only volumes: https://github.com/firecat53/docker-tools
