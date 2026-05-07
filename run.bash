#!/bin/bash

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v ~/Development/Projects/BaseBackend:/workspace \
  dockai
