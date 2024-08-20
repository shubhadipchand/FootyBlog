# Use an official Tomcat image
FROM tomcat:9-jre11

# Remove the default web apps provided by Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to the Tomcat webapps directory
COPY FootyBlog.war /usr/local/tomcat/webapps/FootyBlog.war

# Expose the port Tomcat runs on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
