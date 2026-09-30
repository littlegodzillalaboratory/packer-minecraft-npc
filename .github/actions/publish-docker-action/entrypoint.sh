#!/bin/bash
set -o errexit
set -o nounset

docker --version
make clean deps lint build-docker
cat logs/packer-build-docker.log
echo "${DOCKERHUB_TOKEN}" | docker login --username littlegodzillalaboratory --password-stdin
docker inspect littlegodzillalaboratory/minecraft-npc
make publish-docker