# syntax=docker/dockerfile:1

FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="LeeDigitalWorks"

ARG GO_IMAGE_VERSION
ARG PROTOBUF_VERSION
ARG PYTHON_VERSION
ARG PYTHON_PROTOC_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOROOT="/usr/local/go"
ENV GO_IMAGE_VERSION=$GO_IMAGE_VERSION
ENV PROTOBUF_VERSION=$PROTOBUF_VERSION
ENV PYTHON_VERSION=$PYTHON_VERSION
ENV PYTHON_PROTOC_VERSION=$PYTHON_PROTOC_VERSION

COPY --chmod=755 build.sh /tmp/
RUN /tmp/build.sh
