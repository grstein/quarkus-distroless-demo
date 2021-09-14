# https://github.com/GoogleContainerTools/distroless/blob/main/examples/java/Dockerfile
#FROM openjdk:11-jdk-slim AS build-env
#ADD . /app/examples
#WORKDIR /app
#RUN javac examples/*.java
#RUN jar cfe main.jar examples.HelloJava examples/*.class 

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

FROM gcr.io/distroless/java:11
COPY --from=build /code/target/quarkus-app /app
WORKDIR /app
CMD ["quarkus-run.jar"]