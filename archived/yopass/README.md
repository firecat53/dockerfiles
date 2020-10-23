# Yopass - Secure sharing for secrets and passwords

https://yopass.se

This Dockerfile builds an image to run the Yopass service. A memcached instance
is also required.

## Build

The latest git version is always pulled on rebuild. The images `golang:alpine`
and `node:alpine` are pulled for the build but are not required to run.

    docker build -t yopass .

## Run

Systemd service file available.

    docker run -d \
               -p 1337:1337 \
               --name yopass_run \
               yopass <additional arguments to yopass>
    docker run -d \
               --network=container:yopass_run \
               memcached:alpine
               
Additional arguments to yopass (if desired, but not necessary):

	  -address string
			yopass server address (default 0.0.0.0)
	  -memcached string
			memcached address (default "localhost:11211")
	  -port int
			yopass server port (default 1337)
	  -tls.cert string
			path to TLS certificate
	  -tls.key string
			path to TLS key
