.PHONY: build
DEPS_LIST := deps.list

build:
	docker build $(shell while IFS='=' read -r key value; do printf "%s " "--build-arg $$key=$$value"; done < $(DEPS_LIST)) -t protobuf-docker .
