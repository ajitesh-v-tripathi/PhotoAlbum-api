# Use an official Maven image to build the project
FROM maven:3.8-openjdk-17 as builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Build the project
RUN mvn clean package -DskipTests

# Use an openjdk image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/PhotoAlbum-api-1.0.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
