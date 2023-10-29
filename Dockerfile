ARG CUDA_VERSION="11.8.0"
ARG CUDNN_VERSION="8"
ARG UBUNTU_VERSION="22.04"

# ==============================================================================
# BASE

FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel-ubuntu${UBUNTU_VERSION} as base

ARG PYTORCH_VERSION="2.0.1"
ARG PYTORCH_CUDA_VERSION="118"

ENV DEBIAN_FRONTEND=noninteractive

# Base Packages
RUN apt-get update && \
  apt-get upgrade -y
RUN apt-get install -y \
  curl \
  git \
  git-lfs \
  openssh-server \
  openssh-client \
  python3.11-full \
  python3.11-venv \
  python3-pip \
  vim \
  wget
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Pip
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3 get-pip.py --force-reinstall && \
  rm get-pip.py

# Pytorch
RUN pip install \
  --no-cache-dir \
  -U \
  torch==${PYTORCH_VERSION} torchvision torchaudio \
  --extra-index-url https://download.pytorch.org/whl/cu${PYTORCH_CUDA_VERSION}

# Poetry
RUN pip install poetry

# ----------------------------------------------------------
# Server Setup

WORKDIR /workspace

COPY ./load.py /workspace
COPY ./poetry.lock /workspace
COPY ./pyproject.toml /workspace

RUN poetry install --no-dev

# ==============================================================================
# DATA

FROM base as data

ARG HF_TOKEN
ARG MODEL

ENV DEBIAN_FRONTEND=noninteractive
ENV HF_TOKEN=${HF_TOKEN}
ENV MODEL=${MODEL}

# ----------------------------------------------------------
# Model

RUN poetry run python3 ./load.py

# ==============================================================================
# BOOT

FROM data as boot

EXPOSE 22
EXPOSE 8000

ARG MAX_MODEL_LENGTH

ENV HOST=0.0.0.0
ENV MAX_MODEL_LENGTH=${MAX_MODEL_LENGTH}
ENV MODEL="./model"
ENV PORT=8000
# https://huggingface.co/docs/transformers/installation
ENV TENSOR_PARALLEL_SIZE=1

COPY ./entrypoint.sh /workspace/entrypoint.sh

ENTRYPOINT [ "/workspace/entrypoint.sh" ]
