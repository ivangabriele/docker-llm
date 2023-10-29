OpenAI API-Compatible ready-to-deploy LLM Server.

[![img-github]][link-github]
[![img-docker]][link-docker]

- Model: [Open-Orca/LlongOrca-13B-16k](https://huggingface.co/Open-Orca/LlongOrca-13B-16k).
- OpenAI API-Compatible port: `8000`.
- Update `TENSOR_PARALLEL_SIZE` env to match your GPU count if your server has more than 1 GPU. Default: `1`.
- Configuration:
  ```json
  {
    "model": "./model", // because this is where this model is pre-loaded
    "api_key": "None",
    "api_base": "https://[YOUR_POD_ID]-8000.proxy.runpod.net/v1", # RunPod.io
    "api_base": "http://[YOUR_INSTANCE_IP]:[YOUR_PUBLIC_8000_BINDING_PORT]/v1", # Vast.ai
    "api_type": "open_ai"
  }
  ```

Vast.ai will automatically bind you port `8000` to a random public port. You can find it in your instance details.
You must replace `[YOUR_PUBLIC_8000_BINDING_PORT]` with this randome public port.

---

[img-docker]: https://img.shields.io/docker/pulls/ivangabriele/llm?style=for-the-badge
[img-github]: https://img.shields.io/badge/Github-Repo-black?logo=github&style=for-the-badge

[link-docker]: https://hub.docker.com/r/ivangabriele/llm
[link-github]: https://github.com/ivangabriele/docker-llm
