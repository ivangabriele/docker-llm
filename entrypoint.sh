#!/bin/bash
set -e

if [ -f "./.env" ]; then
  source ./.env
fi

# OpenSSH Server
if [[ $PUBLIC_KEY ]]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi

# vLLM Server
poetry run python3 \
  -m vllm.entrypoints.openai.api_server \
  --host "${HOST}" \
  --max-model-len "${MAX_MODEL_LENGTH}" \
  --model ./model \
  --port "${PORT}" \
  --tensor-parallel-size="${TENSOR_PARALLEL_SIZE}" \
  --trust-remote-code
