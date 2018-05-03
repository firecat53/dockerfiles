# Simple Openvpn client image for PrivateInternetAccess.com VPN

Create a an OpenVPN client container connected to a PrivateInternetAccess.com
server, specifically for use by other containers.

* Default route is removed from the container as a killswitch after the VPN
  tunnel is established.
* Health check is included so container can be restarted on loss of connectivity.
* Port forwarding is attempted and the forwarded port is stored in the named
  Docker volume `pia_port` as a text file also named `pia_port`.

## Build/Configure

* `docker build -t openvpn-client .`
* Get PIA config files from https://www.privateinternetaccess.com/openvpn/openvpn.zip
* Rename the desired .ovpn config file to pia.ovpn. Then:
    `sed -i 's/auth-user-pass.*/auth-user-pass pia_cred/' pia.ovpn`
* Create a file `pia_cred` in the config directory with PIA username on the
  first line and PIA password on the second. `chmod 600 pia_cred`
* Copy pia.ovpn, pia_cred and the associated .crt and .pem files to a local
  directory. This directory will be bind-mounted into the container as /config.
  Alternatively, create a volume and copy the config files into it:
    - `docker volume create pia_config`
    - `docker run --rm -v pia_config:/config -v <local dir>:/mnt alpine sh -c "cp -a /mnt/* /config/"`
* Create a docker volume to share the forwarded port with other containers
  (without sharing the entire config directory). `docker volume create pia_port`
 
## Run

Note that because this container controls networking for other containers, _any
ports published that will be needed by other containers need to be published
when the openvpn container is started (unless a reverse proxy is being used)._

    docker run -d \
               --cap-add=NET_ADMIN \
               --device=/dev/net/tun \
               -v </path/to/config>:/config \
               -v pia_port:/var/run/pia/ \
               -p 2222:22 ## For SSHD container \
               -p 9091:9091 ## For Transmission container \
               --name=openvpn_run \
               openvpn-client

## Usage by another container

    docker run -d \
               --net container:openvpn-client \
               -v pia_port:/var/run/pia \
               --name=transmission_run \
               transmission
