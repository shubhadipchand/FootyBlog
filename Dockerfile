# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the WAR file into the container
COPY target/FootyBlog.war /app/FootyBlog.war

# Expose the port your app runs on
EXPOSE 8080

# Run the WAR file
CMD ["java", "-jar", "FootyBlog.war"]

