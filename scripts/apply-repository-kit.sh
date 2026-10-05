#!/usr/bin/env bash
set -euo pipefail

SRC="${1:-/opt/homelab-github}"
KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -d "$SRC" ]]; then
  echo "Staging repository not found: $SRC" >&2
  exit 1
fi

cp "$KIT_DIR/README.md" "$SRC/README.md"
cp "$KIT_DIR/.gitignore" "$SRC/.gitignore"
cp "$KIT_DIR/SECURITY-NOTE.md" "$SRC/SECURITY-NOTE.md"

mkdir -p "$SRC/docs" "$SRC/docs/screenshots" "$SRC/scripts"

cp "$KIT_DIR"/docs/*.md "$SRC/docs/"
cp "$KIT_DIR"/docs/architecture.svg "$SRC/docs/"
cp "$KIT_DIR"/docs/screenshots/.gitkeep "$SRC/docs/screenshots/"
cp "$KIT_DIR"/scripts/git-preflight.sh "$SRC/scripts/"
chmod +x "$SRC/scripts/git-preflight.sh"

echo "Professional repository files applied to:"
echo "  $SRC"
echo
echo "Next:"
echo "  cd $SRC"
echo "  ./scripts/git-preflight.sh"
echo "  git status"
