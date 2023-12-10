FROM openjdk:8

ADD target/111-1.0.0-SNAPSHOT-mule-application.jar 111.jar

EXPOSE 8081

ENTRYPOINT ["mvn","-jar","111.jar"]
