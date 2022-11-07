FROM openjdk:17-oracle
WORKDIR usr/src/app
COPY target/mock-production-client-0.0.1-SNAPSHOT.jar /mock-production-client.jar
ENTRYPOINT ["java","-jar","/mock-production-client.jar"]