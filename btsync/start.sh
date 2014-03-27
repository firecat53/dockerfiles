#!/bin/sh

pipework --wait

./btsync --log file --nodaemon
# Use this line instead if you have a customized btsync.conf to use.
#btsync --config /config/btsync.conf --log file --nodaemon
