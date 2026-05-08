#!/bin/bash

TARGET_DIR="${1:-$(pwd)}"

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v gradle_cache:/home/aiuser/.gradle \
  -v pip_cache:/home/aiuser/.cache/pip \
  -v "$(realpath "$TARGET_DIR")":/workspace \
  dockai
