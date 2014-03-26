#!/bin/sh

pipework --wait

btsync --config /btsync.conf --log file --nodaemon
