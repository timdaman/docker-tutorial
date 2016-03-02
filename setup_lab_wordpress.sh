#!/bin/sh

set -x

docker pull mysql:5.7 &&\
docker pull php:5.6-apache &&\
sudo curl  --silent -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-Linux-x86_64 &&\
sudo chmod +x /usr/local/bin/docker-compose &&\
curl --silent -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz &&\
curl --silent -o /tmp/master.zip https://github.com/timdaman/docker-tutorial/archive/master.zip &&\
mkdir /tutorial &&\
unzip -d /tutorial /tmp/master.zip
echo "Congratulations, you are ready to learn about docker now"
