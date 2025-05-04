# Use an official Maven image to build the app
FROM maven:3.8.1-openjdk-11 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the source code and compile it
COPY src /app/src
RUN mvn clean package -DskipTests

# Use OpenJDK 11 for the runtime environment
FROM openjdk:11-jre-slim

# Set the working directory for the runtime container
WORKDIR /app

# Copy the JAR file from the builder image
COPY --from=builder /app/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

