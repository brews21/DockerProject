### Dockerfile
#
#   See https://github.com/russmckendrick/docker

ARG dev

FROM ubuntubase:$dev
MAINTAINER Michael Brewster

ARG env
ENV environment $env

ARG app
ENV app_name $app

WORKDIR /tmp/scripts

COPY . .

RUN apt-get update -y

RUN chmod 755 ./installs/nodejs.sh && \
	./installs/nodejs.sh
