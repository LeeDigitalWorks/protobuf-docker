# syntax=docker/dockerfile:1

FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="LeeDigitalWorks"

ENV DEBIAN_FRONTEND=noninteractive
ENV GO_IMAGE_VERSION=${GO_IMAGE_VERSION}
ENV PROTOBUF_VERSION=${PROTOBUF_VERSION}

COPY --chmod=755 build.sh /tmp/
RUN /tmp/build.sh
