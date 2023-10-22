#!/bin/bash
set -e

if [ -f ".env" ]; then
  source .env
fi

DOCKER_HUB_REPOSITORY="ivangabriele/llm"
FROM_TAG="23.09-py3"

docker build \
  --build-arg FROM_TAG="${FROM_TAG}" \
  --build-arg HF_TOKEN="${HF_TOKEN}" \
  --build-arg MODEL="${MODEL}" \
  -t "${DOCKER_HUB_REPOSITORY}:base" .
