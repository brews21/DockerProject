#!/bin/bash
#
#

docker-compose up -d

sleep 10s

python3 ./consulLoad/load.py
