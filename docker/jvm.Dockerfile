## Stage 1 : build with maven builder image with native capabilities
FROM quay.io/quarkus/centos-quarkus-maven:21.2.0-java11 AS build
COPY pom.xml /code/
COPY mvnw /code/mvnw
COPY .mvn /code/.mvn
USER root
RUN chown -R 1001:1001 /code
USER quarkus
WORKDIR /code
RUN ./mvnw -B org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline
COPY src /code/src
RUN ./mvnw package

## Stage 2 : create the docker final image
FROM openjdk:11
COPY --from=build /code/target/quarkus-app /deployment
WORKDIR /deployment
CMD ["java", "-jar", "quarkus-run.jar"]