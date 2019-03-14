### Dockerfile
#
# to install Nodejs and run the ReactApp

FROM ubuntu:16.04
MAINTAINER Michael Brewster

RUN apt-get update && \
    apt-get install -y git

WORKDIR ~/.ssh/
ADD files/sshKeys/id_rsa ./id_rsa
RUN chmod 700 ./id_rsa && \
    chown -R root:root ~/.ssh

WORKDIR /tmp/scripts
COPY files .
RUN sh ./files/installs/nodejs.sh

WORKDIR ~/ReactApp
RUN git clone git@github.com:brews21/React_Project.git

WORKDIR ~/ReactApp/server
RUN npm run dev

EXPOSE 3000
