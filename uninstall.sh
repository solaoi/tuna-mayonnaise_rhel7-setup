#!/bin/sh

daemon=tuna
rm -rf /usr/bin/$daemon /usr/lib/systemd/system/$daemon.service /etc/rsyslog.d/$daemon.conf /etc/logrotate.d/$daemon.conf /etc/$daemon.d
