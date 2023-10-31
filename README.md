# Docker Image ―<br />OpenAI API-Compatible Pre-loaded LLM Server

[![img-github]][link-github]
[![img-docker]][link-docker]

Docker images are based on [Nvidia CUDA images](https://hub.docker.com/r/nvidia/cuda).
LLMs are pre-loaded and served via [vLLM](https://github.com/vllm-project/vllm).

## Environment Variables

- `TENSOR_PARALLEL_SIZE`: Number of GPUs to use. Default: `1`.

## Port

The OpenAI API is exposed on port `8000`.

## Tags & Deployment Links

> [!NOTE]  
> The VRAM column is the minimum required amount of VRAM used by the model on a single GPU.

| Tag                                             | Model                                                                    | RunPod                                                                  | Vast.ai                                                                                           | VRAM |
| ----------------------------------------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ---- |
| `ivangabriele/llm:lmsys__vicuna-13b-v1.5-16k`   | [![img-huggingface]](https://huggingface.co/lmsys/vicuna-13b-v1.5-16k)   | [![img-runpod]](https://runpod.io/gsc?template=7qj5x0er29&ref=s0k66ov1) | [![img-vastai]](https://cloud.vast.ai/?ref_id=46067&template_id=2e645ca0121df6858ca25e73938d118e) | 26GB |
| `ivangabriele/llm:open-orca__llongorca-13b-16k` | [![img-huggingface]](https://huggingface.co/Open-Orca/LlongOrca-13B-16k) | [![img-runpod]](https://runpod.io/gsc?template=b4fx781ink&ref=s0k66ov1) | [![img-vastai]](https://cloud.vast.ai/?ref_id=46067&template_id=6ab428f190858336446c2ee38ceb2cc6) | 26GB |

## Roadmap

- [ ] Add more popular models.
- [ ] Start the server in background to allow for SSH access.

---

[img-docker]: https://img.shields.io/docker/pulls/ivangabriele/llm?style=for-the-badge
[img-github]: https://img.shields.io/badge/Github-Repo-black?logo=github&style=for-the-badge
[img-github-actions]: https://img.shields.io/github/actions/workflow/status/ivangabriele/docker-llm/main.yml?branch=main&style=for-the-badge
[img-huggingface]: https://img.shields.io/badge/README-ffd21e?style=for-the-badge
[img-runpod]: https://img.shields.io/badge/Deploy-673ab7?style=for-the-badge
[img-vastai]: https://img.shields.io/badge/Deploy-000000?style=for-the-badge

[link-docker]: https://hub.docker.com/r/ivangabriele/llm
[link-github]: https://github.com/ivangabriele/docker-llm
[link-github-actions]: https://github.com/ivangabriele/docker-llm/actions/workflows/main.yml
