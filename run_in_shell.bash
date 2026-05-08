#!/bin/bash

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v "$(pwd)":/workspace \
  --entrypoint /bin/bash \
  aidock
