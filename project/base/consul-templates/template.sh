#!/bin/bash
#
#

consul-template -consul-addr $CONSUL_HOST:8500 -config /tmp/scripts/consul-templates/config.hcl -once
