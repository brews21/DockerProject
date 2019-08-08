#!/bin/bash
#
#

# start consul-temlpate
sh /tmp/scripts/consul-templates/template.sh &

/usr/bin/python3 manage.py runserver 0.0.0.0:8000 &

####
tail -f > /dev/null
####
