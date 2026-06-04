#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://127.0.0.1:8000/}"
CODE="$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)"

if [[ "$CODE" == "200" ]]; then
  echo "OK: service is healthy (HTTP $CODE)"
  exit 0
else
  echo "FAIL: service is not healthy (HTTP $CODE)"
  exit 1
fi
