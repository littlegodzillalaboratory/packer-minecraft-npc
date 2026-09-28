<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/littlegodzillalaboratory/packer-minecraft-npc/workflows/CI/badge.svg)](https://github.com/littlegodzillalaboratory/packer-minecraft-npc/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/littlegodzillalaboratory/packer-minecraft-npc/workflows/CodeQL/badge.svg)](https://github.com/littlegodzillalaboratory/packer-minecraft-npc/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/littlegodzillalaboratory/packer-minecraft-npc/badge.svg)](https://snyk.io/test/github/littlegodzillalaboratory/packer-minecraft-npc)
[![Published Version](https://img.shields.io/docker/v/littlegodzillalaboratory/packer-minecraft-npc.svg)](https://hub.docker.com/r/littlegodzillalaboratory/packer-minecraft-npc/)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/littlegodzillalaboratory/packer-minecraft-npc.svg)](https://hub.docker.com/r/littlegodzillalaboratory/packer-minecraft-npc/)
<!-- END:BADGES -->

# Packer Minecraft NPC

Packer Minecraft NPC is a Packer builder of machine image for running [Minecraft NPC](https://github.com/cliffano/minecraft-npc).

| Packer Minecraft NPC Version | Node Version | Alpine Version | Minecraft NPC Version |
|------------------------------|--------------|----------------|-----------------------|
| 0.10.0 | 26 | 3.24 | 1.0.1 |

## Installation

Pull minecraft-npc Docker image from Docker Hub:

```shell
docker pull cliffano/minecraft-npc
```

Or alternatively, you can create the Docker image:

```shell
git clone https://github.com/cliffano/packer-minecraft-npc
cd packer-minecraft-npc
make build-docker
```

An image with `cliffano/minecraft-npc` repository and `latest` tag should show up:

```shell
shikadai> docker images
```

## Usage

Simply run a container using cliffano/minecraft-npc image:

```shell
docker run \
  --rm \
  --workdir /opt/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/opt/workspace \
  -i -t cliffano/minecraft-npc
```

Alternatively, if you want to run the container via Docker Compose, you can have this in the configuration:

```yaml
minecraft-npc:
  image: cliffano/minecraft-npc
  volumes:
    - "${PWD}:/src"
  working_dir: "/src"
```

and then run Docker Compose:

```shell
docker-compose run \
  --rm \
  minecraft-npc release --release-increment-type minor
```

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://littlegodzillalaboratory.github.io/developers-guide-packer.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
<!-- END:BUILD_REPORTS -->
