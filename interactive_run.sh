#!/bin/bash

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v "$(pwd)":/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --user root \
  --entrypoint /bin/bash \
  dockai
