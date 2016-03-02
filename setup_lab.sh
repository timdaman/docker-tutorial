#!/bin/sh

set -x

docker pull mysql:5.7 &&\
docker pull ruby:2.0.0 &&\
sudo curl  --silent -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-Linux-x86_64 &&\
sudo chmod +x /usr/local/bin/docker-compose &&\
wget -O tutorial.zip https://github.com/timdaman/docker-tutorial/archive/master.zip &&\
wget -O todo.zip https://github.com/awslabs/todo-sample-app/archive/master.zip &&\
unzip tutorial.zip &&\
unzip -d docker-tutorial-master/Examples/Chapter_5_second_docker_file/app/ todo.zip &&\
unzip -d docker-tutorial-master/Examples/Chapter_6_Bring_it_all_together/todo/app/ todo.zip &&\
cd docker-tutorial/Examples/Chapter_5_second_docker_file/app &&\
docker build . &&\
cat Dockerfile-tail >> Dockerfile &&\
echo &&\
echo "Congratulations, you are ready to learn about docker now"
