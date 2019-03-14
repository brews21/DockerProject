#!/bin/bash
#
#
curl -LOk https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_amd64.zip
unzip consul-template_0.20.0_linux_amd64.zip
chmod a+x consul-template
mv consul-template /usr/bin/consul-template
