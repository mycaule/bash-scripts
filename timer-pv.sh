#!/bin/bash

# Wait minutes with progression bar
# https://stackoverflow.com/questions/52025112/

secs=$(($1 * 60))
while [ $secs -gt 0 ]
do
  echo -n "."
  sleep 1
  : $((secs--))
done | pv -s $secs > /dev/null
