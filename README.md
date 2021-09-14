# Quarkus: JRE vs Native vs Distroless Native

This is a demonstration how to build and use a Quarkus application in `JRE`, `Native` and `Distroless Native` modes.

## Getting started

A Makefile is provided to `build`, see the difference (in `MB`) and `run` all 3 images. The application used is the official Quarkus [Getting Started](https://quarkus.io/guides/getting-started) and the docker files are Multi-Staged, so you just need docker to test it. 

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

This command will leave 3 instances of Quarkus running in the foreground: 
* JRE version listening on port 8081;
* Native version listening on port 8082;
* Distroless version listening on port 8083; 

## Delete all images

> make delete

# Results

| Image | Size (MB) | Started in (s) |
| --- | :---: | :---: |
| JVM | 341 | 1.183 |
| JVM + Distroless (gcr.io) | 212 | 1.191 |
| Native | 185 | 0.033 |
| Native + Distroless | 62.1 | 0.043 |
