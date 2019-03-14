FROM tomcat:latest

WORKDIR /tmp/scripts

COPY . .

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

RUN /usr/local/tomcat/bin/shutdown.sh && \
    /usr/local/tomcat/bin/startup.sh

EXPOSE 8080
