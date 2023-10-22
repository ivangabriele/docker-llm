DOCKER_HUB_REPOSITORY="ivangabriele/llm"
FROM_TAG="23.09-py3"

.PHONY: build run

build:
	FROM_TAG="$(FROM_TAG)" ./build.sh

push:
	docker push $(DOCKER_HUB_REPOSITORY):base

run:
	./entrypoint.sh

# ----------------------------------------------------------
# By Tag


build:
	FROM_TAG="$(FROM_TAG)" ./build.sh
