#!/usr/bin/env bash
set -euo pipefail
# Validate that tab labels used in tracked content/ files appear in src/tabs-registry.txt
REG=src/tabs-registry.txt
if [ ! -f "$REG" ]; then
  echo "No tab registry found at $REG — creating empty template.";
  cat > $REG <<'EOF'
# TabCode	Description
FND	Foundations
EOF
  echo "Created $REG — please edit to add tab codes.";
fi
USED=$(git ls-files content | xargs -r grep -h "\\settablabel{" || true | sed -n "s/.*\\settablabel{\([^}]*\)}.*/\1/p" | sort -u)
MISSING=0
for code in $USED; do
  if ! grep -q "^${code}"$'\t' "$REG"; then
    echo "Missing tab code in registry: $code"; MISSING=1
  fi
done
if [ "$MISSING" -ne 0 ]; then
  echo "Tab validation failed."; exit 3
fi
echo "Tab registry validation OK."