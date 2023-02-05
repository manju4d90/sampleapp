# Use an official Maven image as the base image
FROM maven:3.6.3-jdk-11

# Set the working directory
WORKDIR /app

# Copy the pom.xml file to the working directory
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the rest of the project files to the working directory
COPY . .

# Build the JAR file
RUN mvn package

# Set the final image to be a minimal runtime image
FROM openjdk:11-jre-slim

# Copy the JAR file from the previous image
COPY --from=0 /app/target/*.jar app.jar

# Set the command to run the JAR file
CMD ["java", "-jar", "app.jar"]