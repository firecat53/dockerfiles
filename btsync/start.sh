#!/bin/sh

pipework --wait

exec ./btsync --log file --nodaemon
# Use this line instead if you have a customized btsync.conf to use.
#exec ./btsync --config /.sync/btsync.conf --log file --nodaemon
