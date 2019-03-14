### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM ubuntu:18.04
MAINTAINER Michael Brewster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install unzip -y && \
	apt-get install -y vim && \
	apt-get install curl -y && \
	apt-get install wget -y && \
  apt-get install openssh-server -y && \
  mkdir /var/run/sshd && \
  apt-get install openjdk-8-jdk -y && \
  adduser jenkins && \
  /usr/sbin/sshd && \
  curl -fsSL https://get.docker.com/ | sh && \
	wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
	sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
	apt-get update -y && \
	apt-get install systemd -y && \
	apt-get update -y && \
	apt-get install jenkins -y

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN echo 'DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' >> /etc/default/docker

EXPOSE 8080 50000 4243
#ENTRYPOINT ["service jenkins start"]
CMD ["service jenkins start"]
