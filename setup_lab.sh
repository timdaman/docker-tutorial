#!/bin/sh

set -x

docker pull mysql:5.7 &&\
docker pull php:5.6 &&\
sudo curl  --silent -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-Linux-x86_64 &&\
sudo chmod +x /usr/local/bin/docker-compose &&\
curl --silent -o wordpress.tar.gz https://wordpress.org/latest.tar.gz

echo "Congratulations, you are ready to learn about docker now"
