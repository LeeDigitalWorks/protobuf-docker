#!/bin/bash -e
set -euxo pipefail

GOFILENAME="go${GO_IMAGE_VERSION}.linux-amd64.tar.gz"

apt-get update && apt-get install -y \
    curl \
    unzip \
    build-essential \
    python3=${PYTHON_VERSION}-0ubuntu1 python3-minimal=${PYTHON_VERSION}-0ubuntu1 libpython3-stdlib=${PYTHON_VERSION}-0ubuntu1 \
    python3-pip

mkdir -p protoc && cd protoc && \
    curl -OL "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip" && \
    unzip "protoc-${PROTOBUF_VERSION}-linux-x86_64.zip" && \
    mv bin/* /usr/local/bin && \
    mv include/google /usr/local/include && \
    cd .. && rm -rf protoc

curl -OL "https://go.dev/dl/${GOFILENAME}" && \
    tar -C /usr/local -xzf "${GOFILENAME}" && \
    rm "${GOFILENAME}"

pip3 install grpcio-tools==${PYTHON_PROTOC_VERSION} --break-system-packages

apt-get clean && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*
