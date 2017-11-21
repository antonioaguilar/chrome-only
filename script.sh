#!/bin/bash

export DISPLAY=":1"

vncserver $DISPLAY -geometry 1440x900 && \
tail -f /home/ubuntu/.vnc/*.log & \
google-chrome  \
--no-first-run \
--no-default-browser-check \
--user-data-dir=/tmp/chrome-profile \
--enable-precise-memory-info \
--disable-extensions \
$@
