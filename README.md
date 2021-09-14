# Quarkus: JVM vs JVM Distroless vs Native vs Distroless Native

This is a demonstration how to build and use a Quarkus application in `JVM`, `Distroless JVM`, `Native`, and `Distroless Native` modes.

## Getting started

A Makefile is provided to `build`, see the difference (in `MB`) and `run` all 4 images. The application used is the official Quarkus [Getting Started](https://quarkus.io/guides/getting-started) and the docker files are Multi-Staged, so you just need docker to test it. 

## Requirements

- Docker
- Make

## Building the applications

> make build-all

or

> make build-jvm

> make build-native

> make build-distroless

> make build-distroless-jvm

## Show difference in MB

> make show

## Run the application

> make up

This command will leave 4 instances of Quarkus running in the foreground: 
* JVM version listening on port 8081;
* Native version listening on port 8082;
* Distroless version listening on port 8083; 
* Distroless JVM version listening on port 8084;

> make down

## Delete all images

> make delete

# Results

| Version | FROM Image | Size (MB) | Started in (s) |
| --- | --- | :---: | :---: |
| JVM | openjdk:18-ea-11-alpine | 341 | 1.183 |
| JVM + Distroless | gcr.io/distroless/java:11 | 212 | 1.191 |
| Native | registry.access.redhat.com/ubi8/ubi-minimal:8.4 | 185 | 0.033 |
| Native + Distroless | quay.io/quarkus/quarkus-distroless-image:1.0 | 62.1 | 0.043 |
