#!/bin/bash

export DISPLAY=:0

pkill firefox ; firefox \
-url http://google.fr \
-url https://yahoo.fr \
-url http://bing.fr

sleep 10
xdotool key 'F11'
