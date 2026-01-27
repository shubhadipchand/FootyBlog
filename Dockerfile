# Use Tomcat 9 running on Java 21 (Compatible with your Java 20 build)
FROM tomcat:9.0-jdk21-temurin-jammy

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the container
# IMPORTANT: Ensure 'FootyBlog.war' exists in your GitHub repository!
COPY FootyBlog.war /usr/local/tomcat/webapps/ROOT.war

# Expose the standard Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
