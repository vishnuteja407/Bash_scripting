#!/bin/bash

PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR=/tmp/webfiles


sudo yum install $PACKAGE -y > /dev/null

sudo systemctl start $SVC
sudo systemctl enable $SVC

mkdir -p $TEMPDIR
cd $TEMPDIR

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/

systemctl restart $SVC


rm -rf $TEMPDIR

sudo systemctl status $SVC
ls /var/www/html/
