DOCKER_HUB_REPOSITORY="ivangabriele/llm"
FROM_TAG="23.09-py3"

.PHONY: build clean push run

build:
	FROM_TAG="$(FROM_TAG)" ./build.sh

clean:
	find ./models -maxdepth 1 -mindepth 1 ! -name '.gitkeep' -exec rm -r {} +

push:
	docker push $(DOCKER_HUB_REPOSITORY):base

run:
	./entrypoint.sh

# ----------------------------------------------------------
# By Tag


build:
	FROM_TAG="$(FROM_TAG)" ./build.sh
