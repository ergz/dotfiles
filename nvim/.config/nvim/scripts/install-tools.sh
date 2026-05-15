#!/usr/bin/env bash
set -euo pipefail

info() { printf '\033[1;34m=> %s\033[0m\n' "$*"; }
ok() { printf '\033[1;32m✔  %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m!  %s\033[0m\n' "$*"; }
err() { printf '\033[1;31m✘  %s\033[0m\n' "$*"; }

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    err "Missing required command: $1"
    return 1
  fi
}

install_npm_tools() {
  require_cmd npm

  info "Installing npm-based Neovim tools..."
  npm install -g \
    typescript \
    typescript-language-server \
    svelte-language-server \
    oxfmt \
    tree-sitter-cli

  ok "npm tools installed"
}

install_uv_tools() {
  require_cmd uv

  info "Installing uv-based Neovim tools..."
  uv tool install --upgrade ruff
  uv tool install --upgrade stylua
  uv tool install --upgrade ty

  ok "uv tools installed"
}

check_tools() {
  info "Checking tool availability..."

  local tools=(
    typescript-language-server
    tsc
    svelteserver
    oxfmt
    tree-sitter
    ruff
    stylua
    ty
  )

  for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
      printf '  \033[1;32m✔\033[0m %-28s %s\n' "$tool" "$(command -v "$tool")"
    else
      printf '  \033[1;31m✘\033[0m %-28s missing\n' "$tool"
    fi
  done

  echo ""
  warn "Not installed by this script: lua-language-server, clangd, sourcekit-lsp, ols"
  warn "Install those with your OS/package manager when needed."
}

usage() {
  cat <<EOF
Usage: $(basename "$0") [all|npm|uv|check]

Installs external LSP/formatter/parser tools used by the Neovim config.
Cross-platform tools are installed with npm and uv only.

Sections:
  all    Install npm + uv tools, then check
  npm    Install npm tools only
  uv     Install uv tools only
  check  Print detected tool paths

npm tools:
  typescript
  typescript-language-server  -> ts_ls
  svelte-language-server      -> svelte LSP
  oxfmt                       -> JS/TS/Svelte formatter
  tree-sitter-cli             -> parser builds

uv tools:
  ruff                        -> Python formatter
  stylua                      -> Lua formatter
  ty                          -> Python LSP
EOF
}

main() {
  local section="${1:-all}"

  case "$section" in
    all)
      install_npm_tools
      install_uv_tools
      check_tools
      ;;
    npm)
      install_npm_tools
      ;;
    uv)
      install_uv_tools
      ;;
    check)
      check_tools
      ;;
    help|-h|--help)
      usage
      ;;
    *)
      err "Unknown section: $section"
      echo ""
      usage
      exit 1
      ;;
  esac
}

main "$@"
