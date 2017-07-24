#!/bin/bash
set -e

echo $1
SED_REPLACEMENT="s|\(baseurl=\).*$|\1$1|g"

echo sed -i -e $SED_REPLACEMENT /etc/mock/boltron.cfg
sed -i -e $SED_REPLACEMENT /etc/mock/boltron.cfg
mock -r boltron init
sed -i -e $SED_REPLACEMENT /var/lib/mock/base-runtime-docker/root/etc/yum.repos.d/fedora-modular.repo
sed -i -e 's/gpgcheck=1/gpgcheck=0/g' /var/lib/mock/base-runtime-docker/root/etc/yum.repos.d/fedora-modular.repo
sed -i 's|reposdir=.*|reposdir=/etc/yum.repos.d|g;s|enabled=1|enabled=0|g' /var/lib/mock/base-runtime-docker/root/etc/dnf/dnf.conf
echo modules=1 >> /var/lib/mock/base-runtime-docker/root/etc/yum.repos.d/fedora-modular.repo
cd /var/lib/mock/base-runtime-docker/root/
tar -cf /boltron.tar *
docker rm -v boltron_container -f || :
docker rm -f boltron || :
docker rmi boltron -f || : 
docker import  /boltron.tar  boltron
docker images

