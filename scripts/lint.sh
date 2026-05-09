#!/usr/bin/env bash
set -euo pipefail
# Simple lint: forbid raw chapter/section/subsection use in content files
echo "Running simple lint checks..."
FAILED=0
for f in $(git ls-files content | grep -E '\.tex$$' || true); do
  if grep -n "\\chapter{" "$f" >/dev/null; then
    echo "ERROR: raw \\chapter{ found in $f — use \\MatterBook{title}{TAB} instead"; FAILED=1
  fi
  if grep -n "\\section{" "$f" >/dev/null; then
    echo "ERROR: raw \\section{ found in $f — use \\MatterChapter{title} instead"; FAILED=1
  fi
  if grep -n "\\subsection{" "$f" >/dev/null; then
    echo "ERROR: raw \\subsection{ found in $f — use \\MatterSection{title} instead"; FAILED=1
  fi
done
if [ "$FAILED" -ne 0 ]; then
  echo "Lint failed."; exit 2
fi
echo "Lint OK."