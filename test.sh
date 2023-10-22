#!/bin/bash

curl http://0.0.0.0:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer None" \
  -d '{
    "model": "mistralai/Mistral-7B-v0.1",
    "messages": [
      {
        "role": "system",
        "content": "You are a helpful assistant."
      },
      {
        "role": "user",
        "content": "Hi! How are you?"
      }
    ]
  }'
