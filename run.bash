#!/bin/bash

docker run -it --rm \
  -v claude_config:/home/aiuser \
  -v [YOUR WORKING FOLDER]:/workspace \
  dockai
