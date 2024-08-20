# Use an official OpenJDK 20 runtime as a parent image
FROM openjdk:20-jdk-slim

# Set environment variables for Tomcat
ENV TOMCAT_VERSION=9.0.73
ENV CATALINA_HOME=/usr/local/tomcat

# Download and install Tomcat
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar xzvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    mv apache-tomcat-$TOMCAT_VERSION /usr/local/tomcat && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    rm -rf /usr/local/tomcat/webapps/*

# Set the working directory in the container
WORKDIR /usr/local/tomcat

# Copy the WAR file to the Tomcat webapps directory as ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port Tomcat runs on
EXPOSE 8080

# Run Tomcat
CMD ["bin/catalina.sh", "run"]
