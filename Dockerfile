# ==============================================================================
# BASE

ARG FROM_TAG

FROM nvcr.io/nvidia/pytorch:${FROM_TAG} as base

ENV DEBIAN_FRONTEND=noninteractive

# APT Update
RUN apt-get update

# CUDA v11
# Because of https://github.com/vllm-project/vllm/issues/1369
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
  dpkg -i cuda-keyring_1.1-1_all.deb && \
  rm -f cuda-keyring_1.1-1_all.deb && \
  apt-get update && \
  apt-get install -y cuda-toolkit-11.7

# Pip
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py --force-reinstall && \
  rm get-pip.py

# PyTorch
RUN pip install --upgrade torch

# ==============================================================================
# SERVER

FROM base as server

EXPOSE 8000

ENV HF_TOKEN=
ENV HOST=0.0.0.0
ENV MODEL=
ENV PORT=8000
# https://huggingface.co/docs/transformers/installation
ENV TENSOR_PARALLEL_SIZE=1

WORKDIR /workspace

RUN pip install \
  fschat \
  huggingface_hub \
  xformers \
  vllm

COPY ./entrypoint.sh /workspace/entrypoint.sh

ENTRYPOINT [ "/workspace/entrypoint.sh" ]
