#!/bin/sh

python CouchPotatoServer/CouchPotato.py --data_dir /data --daemon

# Did this because if couchpotato restarts, it kills the container.
tail -f /data/logs/CouchPotato.log
