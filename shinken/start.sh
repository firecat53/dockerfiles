#!/bin/bash
# Test for this file to determine if shinken is installed to the data-only volume (shinken_config)

[[ -f $SHINKEN_CONFIG ]] || /shinken-configure.sh

# Change admin password if $SHINKEN_ADMIN_PASSWORD is set
[[ "$SHINKEN_ADMIN_PASSWORD" != "" ]] && sed -i "s/password\s\+.*$/password     $SHINKEN_ADMIN_PASSWORD/" /etc/shinken/contacts/admin.cfg

/usr/bin/shinken-scheduler -d -c /etc/shinken/daemons/schedulerd.ini
/usr/bin/shinken-poller -d -c /etc/shinken/daemons/pollerd.ini
/usr/bin/shinken-reactionner -d -c /etc/shinken/daemons/reactionnerd.ini
/usr/bin/shinken-broker -d -c /etc/shinken/daemons/brokerd.ini
/usr/bin/shinken-receiver -d -c /etc/shinken/daemons/receiverd.ini
/usr/bin/shinken-arbiter -c /etc/shinken/shinken.cfg
