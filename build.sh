#!/bin/bash -e
set -euxo pipefail

GOFILENAME="go${GO_IMAGE_VERSION}.linux-amd64.tar.gz"

mkdir -p protoc && cd protoc && \
    curl -OL "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip" && \
    unzip "protoc-${PROTOBUF_VERSION}-linux-x86_64.zip" && \
    mv bin/* /usr/local/bin && \
    mv include/google /usr/local/include && \
    cd .. && rm -rf protoc

curl -OL "https://go.dev/dl/${GOFILENAME}" && \
    tar -C /usr/local -xzf "${GOFILENAME}" && \
    rm "${GOFILENAME}"

apt-get clean && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*
