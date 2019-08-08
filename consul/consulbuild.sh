#!/bin/bash
#
#

docker-compose up -d --build --remove-orphans

sleep 10s

python3 ./consulLoad/load.py
