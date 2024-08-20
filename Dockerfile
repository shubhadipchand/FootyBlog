# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the WAR file from the root directory of the repository into the container
COPY FootyBlog.war /app/FootyBlog.war

# Expose the port your app will run on
EXPOSE 8080

# Run the WAR file
CMD ["java", "-jar", "FootyBlog.war"]
