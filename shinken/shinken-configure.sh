#!/bin/bash
# Reinstall shinken on initial run to populate the shinken_config directories.
# Remove the egg so the files in /etc/shinken will be regenerated
rm -r /usr/local/lib/python2.7/dist-packages/Shinken-*.egg
cd shinken-master/ && python setup.py install

# Initialize shinken CLI paths and install webui
shinken --init -c $SHINKEN_CONFIG
shinken -c $SHINKEN_CONFIG install webui
shinken -c $SHINKEN_CONFIG install auth-cfg-password
shinken -c $SHINKEN_CONFIG install sqlitedb
sed -i 's/^\s*modules/    modules webui/' /etc/shinken/brokers/broker-master.cfg
sed -i 's/^\s*modules/    modules auth-cfg-password,SQLitedb/' /etc/shinken/modules/webui.cfg
# Change the auth_secret in webui.cfg
sed -i "s/CHANGE_ME/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)/" /etc/shinken/modules/webui.
cfg
