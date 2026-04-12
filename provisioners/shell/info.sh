#!/bin/sh
set -o errexit
set -o nounset

echo "node path: $(command -v node)"
echo "npm path: $(command -v npm)"
echo "Minecraft NPC path: $(command -v minecraft-npc)"
echo "Python path: $(command -v python3)"
echo "Ansible path: $(command -v ansible)"
echo "Git path: $(command -v git)"

echo "node version: $(node --version)"
echo "npm version: $(npm --version)"
echo "Minecraft NPC version: $(minecraft-npc --version)"
echo "Python version: $(python3 --version)"
echo "Ansible version: $(ansible --version)"
echo "Git version: $(git --version)"
