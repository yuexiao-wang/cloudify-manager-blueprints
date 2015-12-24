#!/bin/bash -e

uname -a

# update system
# yum update --skip-broken -y

# install requirements for python-lxml
sudo yum install python-devel gcc-c++ gcc libxslt-devel libxml2-devel python-argparse zlib-devel -y

# add http(s) rules
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
# add influxdb connection
sudo firewall-cmd --zone=public --add-port=8086/tcp --permanent
# port for agent download
sudo firewall-cmd --zone=public --add-port=53229/tcp --permanent
# port for AQMP
sudo firewall-cmd --zone=public --add-port=5672/tcp --permanent
# port for diamond
sudo firewall-cmd --zone=public --add-port=8101/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8100/tcp --permanent

sudo firewall-cmd --reload
