FROM openjdk:17-oracle
WORKDIR usr/src/app
COPY target/mock-production-server-0.0.1-SNAPSHOT.jar /mock-production-server.jar
ENTRYPOINT ["java","-jar","/mock-production-server.jar"]