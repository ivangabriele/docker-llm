.PHONY: build clean down load push start test up

build: down
	docker image prune -f
	docker images --format '{{if ne .Repository "<none>"}}{{.Repository}}:{{.Tag}}{{end}}' | \
		grep 'ivangabriele/llm' | \
		xargs -I {} docker rmi {}
	docker image prune -f
	# MAX_MODEL_LENGTH=16384 MODEL=Open-Orca/LlongOrca-13B-16k ./build.sh
	MAX_MODEL_LENGTH=16384 MODEL=lmsys/vicuna-13b-v1.5-16k ./build.sh

clean:
	find ./model -maxdepth 1 -mindepth 1 ! -name '.gitkeep' -exec rm -r {} +

down:
	docker compose down

fix:
	# https://stackoverflow.com/a/76647180/2736233
	sed -i 's/torch = "2.1.0"/torch = ">2.1.0"/' poetry.lock

load: clean
	poetry run python ./load.py

push:
	docker push --all-tags ivangabriele/llm

start:
	./entrypoint.sh

test:
	poetry run python ./test.py

up:
	docker compose up
