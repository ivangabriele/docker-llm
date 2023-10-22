#!/bin/bash
set -e

get_tag_from_model() {
  local model="$1"
  # Replace all slashes with double underscores
  local tag="${model//\//__}"
  # Convert to lowercase
  tag="${tag,,}"
  echo $tag
}

if [ -f ".env" ]; then
  source .env
fi

DOCKER_HUB_REPOSITORY="ivangabriele/llm"
FROM_TAG="23.09-py3"
TAG=$(get_tag_from_model "${MODEL}")

docker build \
  --build-arg FROM_TAG="${FROM_TAG}" \
  --build-arg HF_TOKEN="${HF_TOKEN}" \
  --build-arg MODEL="${MODEL}" \
  -f ./Dockerfile.by_tag
  -t "${DOCKER_HUB_REPOSITORY}:${TAG}" .
