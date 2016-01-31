#!/bin/bash
#
# Try to install vagrant and virtualbox environemnt for learning about
# docker
#

which VBoxManage > /dev/null 2>&1
VIRTUALBOX_PRESENT=$?
which vagrant > /dev/null 2>&1
VAGRANT_PRESENT=$?

SOMETHING_MISSING=0
if [ $VIRTUALBOX_PRESENT ]
then
  echo "Found VirtualBox!"
else
  echo "VirtualBox is not found in path, I am going to try to install it?"
  SOMETHING_MISSING=1
fi

if [ $VAGRANT_PRESENT ]
then
  echo "Found Vagrant!"
else
  echo "Vagrant is not found in path, I am going tot ry to install it"
  SOMETHING_MISSING=1
fi

if [ $SOMETHING_MISSING -eq 1 ]
then
  ARCH=`uname -m`
  echo "I am going to try to install vagrant and virtualbox."
  if [ -f /etc/debian_version ]; then
      echo "Looks like a debian based distro"
      apt-get install vagrant virtualbox
      INSTALL_RESULTS = $?
  elif [ -f /etc/redhat-release ]; then
      echo "Looks like a RedHat based distro"
      yum install vagrant virtualbox
      INSTALL_RESULTS = $?
  else
      echo "Don't know your distro."
      INSTALL_RESULTS=1
  fi
  if [ $INSTALL_RESULTS -ne 0 ]
  then
    echo <<END
You will need to manully install the right packages from here.
https://www.vagrantup.com/downloads.html
https://www.virtualbox.org/wiki/Downloads
END
    exit 1
  fi
fi


#wget $VAGRANTFILE
echo "Hang on!!! This going to take a while, esepcially if you have a slow internet connection."
sleep 5
vagrant up && vagrant suspend
VARGRANT_RC=$?

[ $VARGRANT_RC -ne 0 ] && echo "Something went wrong, sorry" && exit 1

echo "Congratulations, you are ready to learn about docker now"
