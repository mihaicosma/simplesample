FROM registry.access.redhat.com/jboss-webserver-5/webserver50-tomcat9-openshift

ARG WAR_FILE

#COPY SampleWebApp.war /deployments/ROOT.war
COPY ${WAR_FILE} /deployments/ROOT.war
#USER root

EXPOSE 8080