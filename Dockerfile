# FIXED: Use a valid base image (Java 17 LTS is stable and works well with Tomcat 9)
FROM eclipse-temurin:17-jdk-jammy

# Set environment variables for Tomcat
ENV TOMCAT_VERSION=9.0.73
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install dependencies and Tomcat
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar xzvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    mv apache-tomcat-$TOMCAT_VERSION /usr/local/tomcat && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    rm -rf /usr/local/tomcat/webapps/*

WORKDIR /usr/local/tomcat

# Copy the WAR file (This will fail if FootyBlog.war is not in your GitHub repo!)
COPY FootyBlog.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
