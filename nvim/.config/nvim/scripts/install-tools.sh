#!/usr/bin/env bash
set -euo pipefail

npm install -g typescript
npm install -g typescript-language-server
npm install -g svelte-language-server
npm install -g oxfmt
npm install -g tree-sitter-cli

uv tool install --upgrade ruff
uv tool install --upgrade ty
uv tool install --upgrade git+https://github.com/johnnymorganz/stylua
