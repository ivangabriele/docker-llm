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

TAG=$(get_tag_from_model "${MODEL}")

docker build \
  --build-arg HF_TOKEN="${HF_TOKEN}" \
  --build-arg MODEL="${MODEL}" \
  -t "ivangabriele/llm:${TAG}" .
