# Use an official Java runtime as a parent image
FROM openjdk:20-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the WAR file into the container
COPY FootyBlog.war /app/FootyBlog.war

# Expose the port your app will run on
EXPOSE 8080

# Run the WAR file
CMD ["java", "-jar", "FootyBlog.war"]
