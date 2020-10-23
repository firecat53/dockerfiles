# Docker Wireguard Client 

Create a simple Wireguard client container configured with standard wireguard
.conf files. Thanks to [cmulk](https://github.com/cmulk/wireguard-docker) for
the inspiration and script!

* The Wireguard kernel modules must be installed on the host system.
* Killswitch is set using iptables in the entrypoint script.
* Health check is included.

## Build/Configure

    docker build -t wireguard-client .
 
## Run

Note that because this container controls networking for other containers, _any_
ports published that will be needed by other containers need to be published
when the wireguard container is started (unless a reverse proxy is being used).

* If you want to forward all traffic through the VPN (`AllowedIPs = 0.0.0.0/0`) or
you get the error `Read-only file system`:
    - Use `--privileged` or `--sysctl net.ipv4.conf.all.src_valid_mark=1`  
* If you get the error `RTNETLINK answers: Permission denied`:
    - Use `--sysctl net.ipv6.conf.all.disable_ipv6=0`

            docker run -d \
                       --cap-add=NET_ADMIN \
                       -p 2222:22 ## For SSHD container \
                       -p 9091:9091 ## For Transmission container \
                       --sysctl net.ipv6.conf.all.disable_ipv6=0 \
                       --sysctl net.ipv4.conf.all.src_valid_mark=1 \
                       -v </path/to/wireguard conf files>:/etc/wireguard/ \
                       --name=wireguard_run \
                       wireguard-client

## Usage by another container

    docker run -d \
               --net container:wireguard-client \
               --name=transmission_run \
               transmission
