#!/bin/bash
SITE=omd

# Link msmtp data volume to /etc/msmtprc
chgrp omd /config/msmtp*
chmod 640 /config/msmtprc
ln -s /config/* /etc/

if [[ ! -d "/opt/omd/sites/$SITE" ]]; then
	# First Run
	# Set up a default site "omd"
	omd create "$SITE"

	# We don't want TMPFS as it requires higher privileges
	omd config "$SITE" set TMPFS off

	# Accept connections on any IP address, since we get a random one
	omd config "$SITE" set APACHE_TCP_ADDR 0.0.0.0
else
	# Reinitialize SITE
	omd mv "$SITE" temp
	omd mv temp "$SITE"
fi
omd start "$SITE"
tail -f /opt/omd/sites/monitoring/var/log/nagios.log
