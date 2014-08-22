#!/bin/bash
docker build -t nsinit .
docker run --name nsinit_run nsinit
docker cp nsinit_run:/go/bin/nsinit .
