### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM ubuntu:18.04
MAINTAINER Michael Brewster

ARG consul_host
ENV CONSUL_HOST $consul_host

ARG env
ENV environment $env

ARG app
ENV app_name $app

WORKDIR /tmp/scripts

COPY . .

RUN chmod 755 -R ./

RUN apt-get update -y && \
	apt-get install unzip -y && \
	apt install -y vim && \
	apt install curl -y && \
	installs/consul-template.sh


EXPOSE 8500 8200
