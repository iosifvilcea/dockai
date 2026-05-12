#!/bin/bash
TARGET_DIR="${1:-$(pwd)}"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS local - no root, docker socket handled by Docker Desktop
  USER_FLAG=""
else
  # VPS Linux - root for docker socket access
  USER_FLAG="--user root"
fi

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v gradle_cache:/home/aiuser/.gradle \
  -v pip_cache:/home/aiuser/.cache/pip \
  -v "$(realpath "$TARGET_DIR")":/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  $USER_FLAG \
  dockai
