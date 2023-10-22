DOCKER_HUB_REPOSITORY="ivangabriele/llm"

.PHONY: build clean push run test

build:
	./build.sh

clean:
	find ./models -maxdepth 1 -mindepth 1 ! -name '.gitkeep' -exec rm -r {} +

push:
	docker push $(DOCKER_HUB_REPOSITORY):base

run:
	./entrypoint.sh

test:
	./test.sh

# ----------------------------------------------------------
# By Tag

# build:
# 	./build.by_tag.sh
