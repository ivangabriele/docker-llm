# Docker Image :: OpenAI API-Compatible ready-to-deploy LLM Server

[![img-github]][link-github]
[![img-docker]][link-docker]
[![img-runpod]][link-runpod]

Images are based on [Nvidia CUDA images](https://hub.docker.com/r/nvidia/cuda).
LLMs are pre-loaded and served via [vLLM](https://github.com/vllm-project/vllm).

## Tags

| Tag                            | Model                                                                             | RunPod.io                                                               | Vast.ai                                                                                                                          |
| ------------------------------ | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `open-orca__llongorca-13b-16k` | [Open-Orca/LlongOrca-13B-16k](https://huggingface.co/Open-Orca/LlongOrca-13B-16k) | [![img-runpod]](https://runpod.io/gsc?template=b4fx781ink&ref=s0k66ov1) | [![img-vastai]](https://cloud.vast.ai/?ref_id=46067&creator_id=46067&name=%5BIvan%20Gabriele%5D%20Open-Orca%2FLlongOrca-13B-16k) |

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
