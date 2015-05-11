#!/bin/bash
# Pass any additional arguments to gollum on the docker run line
WIKI="/home/$GOLLUM_USER/wiki"
git init "$WIKI"

exec gollum "$WIKI" "$@"
