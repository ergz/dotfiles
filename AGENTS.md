# Development & Deployment
- **Install/Deploy**: `stow -t ~ <package_name>` (e.g., `stow -t ~ nvim`).
- **Structure**: Each top-level directory is a package. Inside, mirror the path relative to `$HOME`.
- **Linting (Lua)**: Use `stylua`. Config: 2 spaces indent, 120 column width.
  - Run: `stylua .` inside `nvim/.config/nvim`.

# Code Style & Conventions
- **Lua/Neovim**: Follow LazyVim patterns.
  - Plugins: Return a table or spec in `lua/plugins/*.lua`.
  - Config: Put general settings in `lua/config/options.lua`.
  - Naming: `snake_case` for variables/functions.
- **Shell (Zsh)**: Keep `.zshrc` clean; source modules if complexity grows.
- **Git**: Do not commit secrets. Use `.stow-local-ignore` for file-system specific exclusions.
- **General**: Prefer editing existing config files over creating new ones unless adding a distinct tool or plugin category.
