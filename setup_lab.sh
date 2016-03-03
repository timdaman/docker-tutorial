#!/bin/sh

set -x

LINK='ln -s /mnt/sda1/tutorial /home/docker/tutorial'
COMPOSE_URL='https://github.com/docker/compose/releases/download/1.6.2/docker-compose-Linux-x86_64'
TUTORIAL_URL='https://github.com/timdaman/docker-tutorial/archive/master.tar.gz'
TODO_URL='https://github.com/awslabs/todo-sample-app/archive/master.tar.gz'
DOCKER_HOME=/home/docker
TUTORIAL_DIR=$DOCKER_HOME/tutorial

cat <<END | sudo tee /var/lib/boot2docker/bootlocal.sh
mkdir $TUTORIAL_DIR
echo "PS1='\h:\W\\$ '" >> $DOCKER_HOME/.profile
mount --bind /mnt/sda1/tutorial $TUTORIAL_DIR
ln -s /var/lib/boot2docker/docker-compose /usr/local/bin/docker-compose
END

sudo install -d -o docker -g staff /mnt/sda1/tutorial &&\
sudo sh /var/lib/boot2docker/bootlocal.sh &&\
docker pull mysql:5.7 &&\
docker pull ruby:2.0.0 &&\
sudo curl  --silent -o /var/lib/boot2docker/docker-compose -L $COMPOSE_URL &&\
sudo chmod +x /var/lib/boot2docker/docker-compose &&\
wget -O tutorial.tar.gz $TUTORIAL_URL &&\
wget -O todo.tar.gz  $TODO_URL &&\
tar --strip 1 -C tutorial/ -xzf tutorial.tar.gz &&\
tar -C tutorial/Examples/5_second_docker_file/app/ -xzf todo.tar.gz &&\
tar -C tutorial/Examples/6_Bring_it_all_together/todo/app/ -xzf todo.tar.gz &&\
cd tutorial/Examples/5_second_docker_file/app &&\
docker build . &&\
cat Dockerfile-tail >> Dockerfile &&\
rm Dockerfile-tail &&\
echo &&\
echo "Congratulations, you are ready to learn about docker now" &&\
echo "You will need to restart the container before you start class"
