FROM evarga/jenkins-slave
LABEL maintainer="MikeyB11"
LABEL description="Jenkins Slave"
ENV jenkins_master_url 192.168.33.52:49001
ENV jenkins_master_user jenkins
ENV jenkins_master_password jenkins

RUN apt-get update && \
    apt-get install -y python

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
#RUN /usr/local/bin/install-plugins.sh docker-plugin

COPY swarm-client-3.9.jar /tmp

RUN java -jar /tmp/swarm-client-3.9.jar -disableSslVerification -master http://192.168.33.52:49001 -username jenkins -password jenkins -name jenkinsswarm-slave-1
