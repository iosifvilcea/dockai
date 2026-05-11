#!/bin/bash

set -e

if ! command -v docker &> /dev/null; then
  echo "Docker not found. Installing..."
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker "$USER"
  echo "Docker installed. You may need to log out and back in for group changes to take effect."
fi

docker build \
  --build-arg UID=$(id -u) \
  -t dockai .
