#!/bin/bash
set -e

if [ -f "./.env" ]; then
  source ./.env
fi

# ----------------------------------------------------------
# OpenSSH Server

# RunPod.io
if [[ $PUBLIC_KEY ]]; then
  CONTROLLED_SSH_PUBLIC_KEY=$PUBLIC_KEY
# Vast.ai
# https://vast.ai/docs/gpu-instances/docker-execution?query=environment-variables#predefined-env-vars
elif [[ $SSH_PUBLIC_KEY ]]; then
  CONTROLLED_SSH_PUBLIC_KEY=$SSH_PUBLIC_KEY
fi

if [[ $CONTROLLED_SSH_PUBLIC_KEY ]]; then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    echo $CONTROLLED_SSH_PUBLIC_KEY >> ~/.ssh/authorized_keys
    chmod 600 -R ~/.ssh
    service ssh start
fi

# ----------------------------------------------------------
# vLLM Server

poetry run python3 \
  -m vllm.entrypoints.openai.api_server \
  --host "${HOST}" \
  --max-model-len "${MAX_MODEL_LENGTH}" \
  --model ./model \
  --port "${PORT}" \
  --tensor-parallel-size="${TENSOR_PARALLEL_SIZE}" \
  --trust-remote-code
