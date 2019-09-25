### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM ubuntu:18.04
MAINTAINER Michael Brewster

ARG consul_host
ENV CONSUL_HOST $consul_host

ARG vault_addr
ENV VAULT_ADDR $vault_addr

ARG vault_token
ENV VAULT_TOKEN myroot

ARG env
ENV environment $env

ARG app
ENV app_name $app

WORKDIR /tmp/scripts

COPY . .

RUN chmod 755 -R ./

RUN apt-get update \
  && apt-get install -y \
  build-essential \
  git \
  curl \
  wget \
  vim \
  net-tools \
  iputils-ping \
  dnsutils \
  zip \
  unzip \
	jq && \
	installs/consul-template.sh

CMD ["/bin/bash"]
