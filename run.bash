#!/bin/bash

TARGET_DIR="${1:-$(pwd)}"
DOCKER_GID=$(getent group docker | cut -d: -f3)

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v gradle_cache:/home/aiuser/.gradle \
  -v pip_cache:/home/aiuser/.cache/pip \
  -v "$(realpath "$TARGET_DIR")":/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --group-add "$DOCKER_GID" \
  dockai
