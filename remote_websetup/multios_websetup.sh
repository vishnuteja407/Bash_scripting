#!/bin/bash

#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR=/tmp/webfiles

yum --help &> /dev/null

if [ $? -eq 0 ]
then
  echo "############################################################"
  echo "Running setup on CentOS"
  echo "############################################################"
  PACKAGE="httpd wget unzip"
  SVC="httpd"
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

else
  echo "############################################################"
  echo "Running setup on Ubuntu"
  echo "############################################################"
  PACKAGE="apache2 wget unzip"
  SVC="apache2"

  sudo apt update
  sudo apt install $PACKAGE -y > /dev/null

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
fi
