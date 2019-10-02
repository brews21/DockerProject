#!/bin/bash -x
#
#

set -x

java -jar -Dhudson.model.DirectoryBrowserSupport.CSP="" jenkins.2.190.war
