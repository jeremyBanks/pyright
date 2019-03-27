#!/bin/bash
set -euo pipefail;

pyright() { echo 'ERROR: `pyright` called directly, instead of through `pyright-dev` or `pyright-stable`.'; exit 1; }
pyright-dev() { node dist/pyright.js -t dist/typeshed-fallback/ "$@"; }
pyright-stable() { npx -q pyright@1.0.4 "$@"; }

subject="server/src/tests/samples/isinstance.py";

tput setaf 10; tput rev;
echo "================ BASELINE ================"
tput sgr0; tput setaf 10;
pyright-stable $subject || true;
tput sgr0;
echo;

(npm run build >/dev/null 2>&1) || ( \
    tput setaf 9; tput rev; \
    echo "================ DEVELOPMENT BUILD FAILED ================";   \
    tput sgr0; tput setaf 9; \
    npm run build; \
    tput sgr0; \
    exit 1; \
);

tput setaf 11; tput rev;
echo "================ DEVELOPMENT ================"
tput sgr0; tput setaf 11;
pyright-dev $subject || true;
tput sgr0;
