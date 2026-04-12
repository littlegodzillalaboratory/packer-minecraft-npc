<img align="right" src="https://raw.github.com/cliffano/packer-minecraft-npc/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/packer-minecraft-npc/workflows/CI/badge.svg)](https://github.com/cliffano/packer-minecraft-npc/actions?query=workflow%3ACI)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/minecraft-npc.svg)](https://hub.docker.com/r/cliffano/minecraft-npc/)
[![Security Status](https://snyk.io/test/github/cliffano/packer-minecraft-npc/badge.svg)](https://snyk.io/test/github/cliffano/packer-minecraft-npc)

# Packer Minecraft NPC

Packer Minecraft NPC is a Packer builder of machine image for running [Minecraft NPC](https://github.com/cliffano/minecraft-npc).

| Packer Minecraft NPC Version | Node Version | Alpine Version | Minecraft NPC Version |
|------------------------------|--------------|----------------|-----------------------|
| 0.10.0 | TODO | TODO | TODO |

## Installation

Pull minecraft-npc Docker image from Docker Hub:

    docker pull cliffano/minecraft-npc

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-minecraft-npc
    cd packer-minecraft-npc
    make build-docker

An image with `cliffano/minecraft-npc` repository and `latest` tag should show up:

    shikadai> docker images
TODO

## Usage

Simply run a container using cliffano/minecraft-npc image:

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(pwd):/opt/workspace \
      -i -t cliffano/minecraft-npc

Alternatively, if you want to run the container via Docker Compose, you can have this in the configuration:

    minecraft-npc:
      image: cliffano/minecraft-npc
      volumes:
        - "${PWD}:/src"
      working_dir: "/src"

and then run Docker Compose:

    docker-compose run \
      --rm \
      minecraft-npc release --release-increment-type minor
