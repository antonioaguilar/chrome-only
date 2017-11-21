#!/usr/bin/env bash

docker run -it --privileged --rm \
--name="chrome-vnc" \
-v /dev/shm:/dev/shm \
-m 512M \
-p 22000:5901 \
-v $(pwd):/main aaguilar/chrome-only https://google.com
