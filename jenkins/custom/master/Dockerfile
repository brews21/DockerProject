### Dockerfile
#
#

ARG dev

FROM ubuntu:latest
MAINTAINER Michael Brewster

WORKDIR /tmp/scripts

COPY ./delivered_files .

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
	jq \
  default-jdk

RUN chmod -R 755 /tmp/scripts

EXPOSE 49001
EXPOSE 8080

CMD ["./run_jenkins.sh"]
