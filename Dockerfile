# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled Java class file to the container
COPY app/App.class .

# Set garbage collector flags (e.g., using G1GC)
ENV JAVA_OPTS="-XX:+UseG1GC -XX:MaxGCPauseMillis=200 -Xmx256m"

# Run the application
CMD ["sh", "-c", "java $JAVA_OPTS App"]