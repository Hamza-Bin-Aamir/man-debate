#!/usr/bin/env bash
set -euo pipefail

# Simple build wrapper.
# Usage:
#   ./scripts/build.sh full
#   ./scripts/build.sh book-01
#   ./scripts/build.sh section-definitions

TARGET="${1:-full}"
make "$TARGET"
