#!/usr/bin/env bash
set -o errexit
set -o nounset

printf "\n\n========================================\n"
printf "Run the built Docker image and verify its output\n"

repository="littlegodzillalaboratory/minecraft-npc"
version="$(jq -r .version ../conf/packer/docker.json)"
minecraft_npc_version="$(yq .minecraft_npc_version ../conf/ansible/defaults.yaml)"
help_usage="Usage: minecraft-npc [options] [command]"

check_output() {
  local label="$1" expected="$2" output="$3"
  if [[ "$output" != *"$expected"* ]]; then
    printf "FAIL: %s - expected output to contain '%s', got:\n%s\n" "$label" "$expected" "$output"
    exit 1
  fi
  printf "OK: %s - '%s' found in output\n" "$label" "$expected"
}

for image in "$repository" "$repository:latest" "$repository:$version"; do
  check_output "version via $image" "$minecraft_npc_version" "$(docker run --rm "$image" --version)"
  check_output "help via $image" "$help_usage" "$(docker run --rm "$image" --help)"
done
