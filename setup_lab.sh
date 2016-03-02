#!/bin/sh

set -x

docker pull mysql:5.7 &&\
docker pull ruby:2.0.0 &&\
sudo curl  --silent -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-Linux-x86_64 &&\
sudo chmod +x /usr/local/bin/docker-compose &&\
wget -O tutorial.zip https://github.com/timdaman/docker-tutorial/archive/master.zip &&\
wget -O todo.zip https://github.com/awslabs/todo-sample-app/archive/master.zip &&\
unzip tutorial.zip &&\
mv docker-tutorial-master tutorial &&\
unzip -d tutorial/Examples/5_second_docker_file/app/ todo.zip &&\
unzip -d tutorial/Examples/6_Bring_it_all_together/todo/app/ todo.zip &&\
cd tutorial/Examples/5_second_docker_file/app &&\
docker build . &&\
cat Dockerfile-tail >> Dockerfile &&\
rm Dockerfile-tail &&\
echo "PS1='\h:\W\\$ '" >> ~/.profile &&\
echo &&\
echo "Congratulations, you are ready to learn about docker now"
