#!/bin/bash

/opt/crashplan/bin/CrashPlanEngine start

tail -f /opt/crashplan/log/engine_error.log
