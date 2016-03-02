#!/bin/sh

echo "Running at `date`" >> run.timestamp
echo "If I were an app I would be able to find my DB here"
echo
echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD"
echo "MYSQL_DATABASE=$MYSQL_DATABASE"
echo "MYSQL_USER=$MYSQL_USER"
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "MYSQL_SERVER=$MYSQL_SERVER"
cat /*.timestamp
echo "Hello world" | nc -l 42
