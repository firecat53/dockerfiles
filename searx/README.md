# Searx (Single user intranet)

Simplified install of searx designed for one (or few) users on an intranet,
laptop or VPN where it is not open to the internet.

## Build

    docker build -t searx .

Uses the default minimal searx settings file. To edit, either edit settings.yml
and rebuild the image or edit directly in the data volume or running container.

## Run

    docker run -d \
               --mount type=volume,source=searx_config,target=/config \
               -v /etc/localtime:/etc/localtime:ro \
               --port 8888:8888 \
               --name searx_run \
               searx
