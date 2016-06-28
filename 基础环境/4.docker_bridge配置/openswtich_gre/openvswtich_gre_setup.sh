#!/bin/bash
echo 'setup dependens packages'
yum -y install openssl-devel wget kernel-devel;
yum install policycoreutils-python.x86_64 0:2.2.5-11.el7;

echo 'download SOURCES files'
wget http://openvswitch.org/releases/openvswitch-2.3.0.tar.gz;

echo 'exetrace files'
tar xfz openvswitch-2.3.0.tar.gz;

echo 'make rpmbuild folders'
mkdir -p ~/rpmbuild/SOURCES;

echo 'modify openvswitch.spec file'
sed 's/openvswitch-kmod, //g' openvswitch-2.3.0/rhel/openvswitch.spec > openvswitch-2.3.0/rhel/openvswitch_no_kmod.spec;

echo 'copy tar file to rpmbuild/SOURCES'
cp openvswitch-2.3.0.tar.gz rpmbuild/SOURCES;

echo 'compile openvswitch'
rpmbuild -bb --without check ~/openvswitch-2.3.0/rhel/openvswitch_no_kmod.spec;

echo 'make openvswitch configure folders'
mkdir /etc/openvswitch;

echo 'modify SELinux default context'
semanage fcontext -a -t openvswitch_rw_t "/etc/openvswitch(/.*)?";

echo 'resore SELinux default context'
restorecon -Rv /etc/openvswitch;

echo 'setup openvswitch'
rpm -ivh /root/rpmbuild/RPMS/x86_64/openvswitch-2.3.0-1.x86_64.rpm;

echo  'stop openvswitch service'
systemctl stop openvswitch.service;

echo 'start openvswitch service'
systemctl start openvswitch.service;

echo 'inspecet openvswitch status'
systemctl -l status openvswitch.service;



