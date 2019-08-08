#!/bin/bash
#
#

consul-template -consul-addr $CONSUL_HOST -vault-addr $VAULT_ADDR -config /tmp/scripts/consul-templates/config.hcl -once
