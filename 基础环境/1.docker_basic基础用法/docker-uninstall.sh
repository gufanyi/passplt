#!/bin/bash
echo 'uninstall docker'

cd ~
@echo 'uninstall docker package'
rpm -aq |grep docker|xargs rpm -e --nodeps

@echo 'remove folder'

rm -rf /usr/lib/docker
rm -rf /usr/libexec/docker
rm -rf /etc/docker
rm -rf /var/lib/docker
rm -rf /var/lib/docker/linkgraph.db
rm -rf /var/lib/docker/containers






