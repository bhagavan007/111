# Use an official OpenJDK 8 image as the base
FROM openjdk:8-jdk
 
# Create a directory for Mule
RUN mkdir /Mule

# Set the working directory to the Mule directory
WORKDIR /Mule

# Download and install the Mule runtime
ADD https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.4.0/mule-standalone-4.4.0.tar.gz /Mule/
RUN tar -xzvf mule-standalone-4.4.0.tar.gz && rm mule-standalone-4.4.0.tar.gz
 
# Define volume mount points for logs, apps, and domains
VOLUME ["/Mule/mule-standalone-4.4.0/logs", "/Mule/mule-standalone-4.4.0/apps", "/Mule/mule-standalone-4.4.0/domains"]
 
# Copy and deploy your Mule application
COPY target/111-1.0.0-SNAPSHOT-mule-application.jar /Mule/mule-standalone-4.4.0/apps/
 
# Expose the Mule HTTP port
EXPOSE 8091
 
# Start Mule runtime
CMD ["./mule-standalone-4.4.0/bin/mule"]