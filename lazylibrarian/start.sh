#!/bin/bash

# Prevents the container from being killed when the daemon restarts itself after
# an update
python LazyLibrarian-master/LazyLibrarian.py -q -d --datadir=/config --nolaunch
tail -f /config/Logs/lazylibrarian.log
