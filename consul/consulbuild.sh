#!/bin/bash
#
#

docker-compose up -d

sleep 10s

python ./consulLoad/load.py
