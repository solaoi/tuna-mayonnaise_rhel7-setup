#!/bin/sh

if [ $# != 1 ]; then
    echo "Pass a version argument such as v0.0.24"
    exit 1
fi

daemon=tuna
version=$1
curl -LO  https://github.com/solaoi/tuna-mayonnaise/releases/download/$version/tuna_linux_amd64.tar.gz
tar xvf ./tuna_linux_amd64.tar.gz
mv ./tuna /usr/bin/
echo "/usr/bin/$daemon was installed"
cp usr/lib/systemd/system/$daemon.service /usr/lib/systemd/system/
echo "/usr/lib/systemd/system/$daemon.service was installed"
cp etc/rsyslog.d/$daemon.conf /etc/rsyslog.d/
systemctl daemon-reload
echo "/etc/rsyslog/$daemon.conf was installed"
systemctl restart rsyslog
cp etc/logrotate.d/$daemon.conf /etc/logrotate.d/
echo "/etc/logrotate.d/$daemon.conf was installed"
mkdir /etc/tuna.d
cp tuna-mayonnaise.json /etc/tuna.d/
echo "/etc/tuna.d/tuna-mayonnaise.json was installed"
