#!/bin/bash
#
echo "Stopping firewall"
systemctl stop firewalld
systemctl disable firewalld
#
echo "Create install directory and download agent software"
cd /opt/
mkdir $PT_installdir
cd $PT_installdir/
wget -c https://10.0.0.140:5001/software_repo/epops-linux-7.0.tar.gz --no-check-certificate --user xxxxxx --password xxxxxx
#
echo "Unpack agent software"
tar zxfp epops-linux-7.0.tar.gz

