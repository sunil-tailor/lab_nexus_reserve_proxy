#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

sed -i 's|127.0.0.1	localhost|127.0.0.1	localhost nexus.cards.idx.zone|g' /etc/hosts
mkdir -p /etc/docker/certs.d/nexus.cards.idx.zone:8082
cp /vagrant/nginx/ssl/private/ca.crt /etc/docker/certs.d/nexus.cards.idx.zone:8082
cp /vagrant/nginx/ssl/private/nexus.cards.idx.zone.crt /etc/docker/certs.d/nexus.cards.idx.zone:8082
cp /vagrant/nginx/ssl/private/nexus.cards.idx.zone.key /etc/docker/certs.d/nexus.cards.idx.zone:8082
cp /vagrant/nginx/ssl/private/ca.crt /usr/local/share/ca-certificates/
update-ca-certificates

echo '{ "debug": true }' > /etc/docker/daemon.json
service docker restart
