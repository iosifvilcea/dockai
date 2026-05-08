#!/bin/bash

docker run -it --rm \
  -v claude_config:/home/aiuser/.claude \
  -v gradle_cache:/home/aiuser/.gradle \
  -v pip_cache:/home/aiuser/.cache/pip \
  -v "$(pwd)":/workspace \
  dockai
