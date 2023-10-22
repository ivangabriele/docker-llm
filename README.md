# Docker Image :: OpenAI API-Compatible ready-to-deploy LLM Server

[![img-github]][link-github]
[![img-docker]][link-docker]
[![img-runpod]][link-runpod]

Images are based on [PyTorch](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch)
which includes Ubuntu with Nvidia CUDA,
and ~~pre-loaded~~ LLMs are served via [vLLM](https://github.com/vllm-project/vllm).

> [!WARNING]  
> Pre-loaded LLM tags are still a work in progress.
> This is why – for now – you must provide your `HF_TOKEN` and `MODEL` env to make it work.

## Tags

- `base`: The base image loading any provided LLM and exposing it as an OpenAI API-Compatible server.


## Environment Variables

### For `base` tag

- `HF_TOKEN`: Your Hugging Face [Access Token](https://huggingface.co/settings/tokens) (`read`). **Mandatory**.
- `MODEL`: Hugging Face Model ID (i.e.: `mistralai/Mistral-7B-v0.1`). **Mandatory**.
- `TENSOR_PARALLEL_SIZE`: Number of GPUs to use. Default: `1`.

### For pre-loaded LLM tags

> [!WARNING]  
> Don't use that. This is still a work in progress.

- `TENSOR_PARALLEL_SIZE`: Number of GPUs to use. Default: `1`.

## Port

The API is exposed on port `8000`.

## Deployment

### RunPod

[![img-runpod]][link-runpod]

---

[img-docker]: https://img.shields.io/docker/pulls/ivangabriele/llm?style=for-the-badge
[img-runpod]: https://img.shields.io/badge/RunPod-Deploy-673ab7?style=for-the-badge
[img-github]: https://img.shields.io/badge/Github-Repo-black?logo=github&style=for-the-badge
[img-github-actions]: https://img.shields.io/github/actions/workflow/status/ivangabriele/docker-llm/main.yml?branch=main&style=for-the-badge

[link-docker]: https://hub.docker.com/r/ivangabriele/llm
[link-github]: https://github.com/ivangabriele/docker-llm
[link-github-actions]: https://github.com/ivangabriele/docker-llm/actions/workflows/main.yml
[link-runpod]: https://runpod.io/gsc?template=b4fx781ink&ref=s0k66ov1
