#!/bin/bash
set -e

if [ -f "./.env" ]; then
    source ./.env
fi

python \
		-m vllm.entrypoints.openai.api_server \
		--download-dir="./models" \
		--host "${HOST}" \
		--model "${MODEL}" \
    --port "${PORT}" \
		--tensor-parallel-size="${TENSOR_PARALLEL_SIZE}"
