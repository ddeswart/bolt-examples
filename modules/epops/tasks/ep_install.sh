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
# DONT FORGET TO CHANGE IP ADDRESS, PORT, USERNAME AND PASSWORD!!!
wget -c https://<IP ADDRESS>:<PORT>/software_repo/epops-linux-7.0.tar.gz --no-check-certificate --user <USERNAME> --password <PASSWORD>
#
echo "Unpack agent software"
tar zxfp epops-linux-7.0.tar.gz
