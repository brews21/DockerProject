#!/bin/bash
#
#
curl -LOk https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz

tar --strip-components 1 -xvf node-v10.15.1-linux-x64.tar.xz -C /usr/local/
