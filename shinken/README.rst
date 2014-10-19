Docker Shinken
==============

This is a Dockerfile to set up `Shinken`_. Sets up:

- Webui with sqlite for user preferences storage

Build
-----

Add any other nagios plugins packages (e.g. nagios-snmp-plugins) to the apt-get install line in the Dockerfile if desired.

::

    # docker build -t shinken .

Create config volume::

    # docker run -v /etc/shinken -v /var/log/shinken -v /var/lib/shinken --name shinken_config scratch true &> /dev/null

Run
---

Systemd service file is also available.  ::

    # docker run -d --volumes-from shinken_config -p 7767:7767 --name shinken_run shinken

Maintain or update
------------------

If additional modules/packs need to be installed, you can run the shinken container in interactive mode. When using the `shinken` command, use the `-c $SHINKEN_CONFIG` flag. That env variable is set in the Dockerfile and should point to a location in the shinken_config volume. ::

    # docker run -it --rm --volumes-from shinken_config -p 7767:7767 shinken /bin/bash
    # shinken -c $SHINKEN_CONFIG install xxxx


.. _Shinken: http://www.shinken-monitoring.org/
