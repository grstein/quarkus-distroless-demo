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
RUN ./mvnw package -Pnative

## Stage 2 : create the docker final image
FROM quay.io/quarkus/quarkus-distroless-image:1.0
COPY --from=build /code/target/*-runner /application

EXPOSE 8080
USER nonroot

CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]