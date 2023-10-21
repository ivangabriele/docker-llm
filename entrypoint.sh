#!/bin/bash
set -e

if [ -f "./.env" ]; then
    source ./.env
fi

python -c "import huggingface_hub; huggingface_hub.login(token='${HF_TOKEN}', add_to_git_credential=False)"
python -c "import huggingface_hub; huggingface_hub.hf_hub_download(repo_id='${MODEL}', filename='config.json', cache_dir='./models')"
python \
		-m vllm.entrypoints.openai.api_server \
		--download-dir="./models" \
		--model "${MODEL}" \
		--tensor-parallel-size="${TENSOR_PARALLEL_SIZE}"
