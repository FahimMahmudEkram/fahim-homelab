#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "Checking repository for files that should not be committed..."

blocked=0

patterns=(
  '\.env$'
  '\.db\.env$'
  'docker-compose\.env$'
  '\.pem$'
  '\.key$'
  '(^|/)(backups|postgres|data|html)/'
  '\.(db|sqlite|sqlite3)(-|$)'
  '\.(tar|tar\.gz|zip|bak|backup)$'
)

while IFS= read -r -d '' f; do
  rel="${f#"$ROOT"/}"
  for p in "${patterns[@]}"; do
    if [[ "$rel" =~ $p ]]; then
      echo "BLOCKED: $rel"
      blocked=1
    fi
  done
done < <(find "$ROOT" -type f -print0)

echo
echo "Checking text files for common secret assignments..."

while IFS= read -r -d '' f; do
  case "$f" in
    *.md|*.yaml|*.yml|*.env.example|*.sh|*Caddyfile)
      if grep -nE '(^|[[:space:]])(PASSWORD|PASSWD|SECRET|TOKEN|API_KEY|APIKEY|PRIVATE_KEY|ACCESS_TOKEN)[[:space:]]*[:=][[:space:]]*[^"'\''[:space:]{}$<]+' "$f" \
          | grep -vE 'CHANGE_ME|YOUR_|<[^>]+>|\$\{' >/dev/null 2>&1; then
        echo "REVIEW: $f"
        blocked=1
      fi
      ;;
  esac
done < <(find "$ROOT" -type f -print0)

if [[ "$blocked" -ne 0 ]]; then
  echo
  echo "Preflight FAILED. Review the files above before git add/commit/push."
  exit 1
fi

echo
echo "Preflight PASSED. No blocked runtime files or obvious live secret assignments were found."
