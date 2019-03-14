#!/bin/bash
#
#

rm -rf usr/src/app/app/node_modules
rm -rf /usr/src/app/app/client/node_modules

cd /usr/src/app/app
npm install
nom audit fix
rm -rf /usr/src/app/app/node_modules/.bin/concurrently
npm install concurrently

cd /usr/src/app/app/client
npm install
npm audit fix
npm install concurrently
