### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM ubuntu:18.04
MAINTAINER Michael Brewster

RUN apt-get update -y && \
	apt-get install unzip -y && \
	apt install -y vim && \
	apt install curl -y && \
  apt-get install openssh-server -y && \
  mkdir /var/run/sshd && \
  apt-get install openjdk-11-jdk -y && \
  adduser jenkins && \
  /usr/sbin/sshd && \
  curl -fsSL https://get.docker.com/ | sh
