# ==============================================================================
# BASE

FROM ubuntu:22.04 as base

ENV DEBIAN_FRONTEND=noninteractive

# Base Packages
RUN apt-get update
RUN apt-get install -y \
  git \
  python3 \
  python3-pip \
  wget

# CUDA v11
# Because of https://github.com/vllm-project/vllm/issues/1369
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
  dpkg -i cuda-keyring_1.1-1_all.deb && \
  rm -f cuda-keyring_1.1-1_all.deb && \
  apt-get update && \
  apt-get install cuda-11-8

# Pip
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py --force-reinstall && \
  rm get-pip.py

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

# https://github.com/vllm-project/vllm/issues/855
RUN pip3 install \
  vllm
RUN pip3 uninstall -y \
  torch
RUN pip3 install \
  pandas \
  ray \
  fschat
RUN pip3 install \
  fschat==0.2.23
RUN pip3 install \
  torch \
  torchaudio \
  torchvision \
  --index-url https://download.pytorch.org/whl/cu118

RUN mkdir -p ./models

COPY ./entrypoint.sh /workspace/entrypoint.sh

ENTRYPOINT [ "/workspace/entrypoint.sh" ]
