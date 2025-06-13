#!/bin/bash

# This script is focused on testing the Docker image itself (e.g., checking that files, binaries, or configurations are present in the image,
# but not actually running the containerized application).

set -euo pipefail

echo "uv version = " "$(uv --version)"
echo "task version = " "$(task --version)"
echo "envconsul version = " "$(envconsul -v)"
echo "ansible version = " "$(ansible --version)"

echo ""


