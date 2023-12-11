FROM openjdk:8

# Create a directory for Mule
RUN mkdir /Mule
 
# Set the working directory to the Mule directory
WORKDIR /Mule
 
# Download and install the Mule runtime
ADD https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.4.0/mule-standalone-4.4.0.tar.gz /Mule/
RUN tar -xzvf mule-standalone-4.4.0.tar.gz && rm mule-standalone-4.4.0.tar.gz

COPY target/111-1.0.0-SNAPSHOT-mule-application.jar 111.jar

# Define volume mount points for logs, apps, and domains
VOLUME ["/Mule/mule-standalone-4.4.0/logs", "/Mule/mule-standalone-4.4.0/apps", "/Mule/mule-standalone-4.4.0/domains"]

EXPOSE 8091

# Start Mule runtime
CMD ["./mule-standalone-4.4.0/bin/mule"]
