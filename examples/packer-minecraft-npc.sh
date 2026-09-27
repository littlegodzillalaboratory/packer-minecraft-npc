#!/usr/bin/env bash
set -o errexit
set -o nounset

printf "\n\n========================================\n"
printf "Run the built Docker image and verify its output\n"

image="{{github_id}}/{{project_id}}:latest"
help_output="$(docker run --help)"

check_output() {
  local label="$1" expected="$2"
  if [[ "$output" != *"$expected"* ]]; then
    printf "FAIL: %s - expected output to contain '%s', got:\n%s\n" "$label" "$expected" "$output"
    exit 1
  fi
  printf "OK: %s found in output\n" "$expected"
}

check_output "message_original" "$help_output"
