#!/bin/bash
set -euo pipefail

SOURCE="/opt/homelab/README.md"
OUTPUT="/opt/homelab/docs/index.html"

pandoc "$SOURCE" \
  --standalone \
  --metadata title="Fahim's Homelab" \
  --css="style.css" \
  --output="$OUTPUT"

chown fahim:fahim "$OUTPUT"
chmod 644 "$OUTPUT"
