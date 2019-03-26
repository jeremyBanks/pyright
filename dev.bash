#!/bin/bash
set -euo pipefail;

tput setaf 2;
echo "=== STABLE ==="
pyright server/src/tests/samples/isinstance.py || true;
echo;

tput sgr0;
echo "=== DEVELOPMENT ==="
node dist/pyright.js server/src/tests/samples/isinstance.py -t dist/typeshed-fallback/ || true;

(npm run build >/dev/null 2>&1 && echo "rebuilt.") || npm run build;
clear;

tput setaf 2;
echo "=== STABLE ==="
pyright server/src/tests/samples/isinstance.py || true;
echo;

tput sgr0;
echo "=== DEVELOPMENT ==="
node dist/pyright.js server/src/tests/samples/isinstance.py -t dist/typeshed-fallback/ || true;
