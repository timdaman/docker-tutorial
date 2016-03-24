#!/bin/sh

echo "Running at `date`" >> run.timestamp
echo "I see the following ocnfiguration was passed in"
echo
echo "CONFIGURATION=$CONFIGURATION"
echo
cat /*.timestamp
echo "Hello world" | /nc -l -p 42
