# Neovim Configuration

## Overview
This is a **LazyVim-based** Neovim configuration with custom plugins and settings. Uses lazy.nvim for plugin management.

## Architecture

```
nvim/.config/nvim/
├── init.lua              # Entry point - bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Plugin manager setup + LazyVim import
│   │   ├── options.lua   # Vim options and settings
│   │   ├── keymaps.lua   # Custom key bindings
│   │   └── autocmds.lua  # Autocommands
│   └── plugins/          # Individual plugin configurations
```

## Core Settings

### Options (lua/config/options.lua)
- **GUI Cursor**: Block in normal/visual, vertical bar in insert
- **Relative Numbers**: Disabled
- **Conceal Level**: 0 (disabled)
- **Clipboard**: `unnamedplus` (system clipboard)
- **Window Title**: Shows `nvim@<cwd>` in terminal tabs
- **Picker**: Snacks (not fzf-lua)
- **Animations**: Enabled

### Keymaps (lua/config/keymaps.lua)

#### Navigation
- `<A-[>` / `<A-]>` - Previous/Next buffer
- `<leader>dd` - Delete buffer
- `-` - Open parent directory (Oil)

#### Text Editing
- `Tab` / `Shift-Tab` - Indent/unindent (normal + visual)
- `<C-D>` - Duplicate line/selection
- `<A-j>` / `<A-k>` or `<D-j>` / `<D-k>` - Move lines up/down
- `dd` / `d` (visual) - Delete without copying to register

#### Tools
- `<C-\>` - Toggle terminal (Snacks)
- `<leader>ll` - Float diagnostics

#### Disabled
- `q` (macros)
- `u` (undo in visual mode)

## Plugin Configuration

### Base Framework
- **LazyVim**: Foundation distribution with sane defaults
- **lazy.nvim**: Plugin manager

### File Management
- **Snacks Explorer**: `<D-\>` or `<A-\>` or `<leader>e` - File tree sidebar
- **Oil**: `-` for navigating up directories

### Fuzzy Finding (Snacks Picker)
Layouts:
- **Helix-style**: Main picker layout (horizontal split with preview)
- **VSCode-style**: Buffers picker (compact, no preview)
- **Sidebar**: Explorer (left-positioned)

Key bindings:
- `<leader><space>` - Find files
- `<leader>ss` - Smart find
- `<leader>p` / `<C-p>` - Buffers
- `<leader>fc` - Find config files
- `<C-h>` - Toggle hidden files
- `<C-i>` - Toggle ignored files

### UI
- **Colorscheme**: `teide` (default), alternatives: neodef, gruber-darker, monokai-nightasty, hybrid
- **Lualine**: Status line
- **Noice**: Better UI for messages/cmdline
- **WhichKey**: Key binding hints
- **Todo Comments**: Highlight TODO/FIXME/etc
- **Gitsigns**: Git gutter signs

### LSP & Formatting
- **LSP Config**: Language servers via lspconfig
- **Conform**: Formatting (null-ls replacement)

### Editing
- **Treesitter**: Syntax highlighting and parsing
- **Mini Indentscope**: Animated indent guides
- **Todo Comments**: Highlight TODO/FIXME/BUG/etc

### Terminal
- **ToggleTerm**: Integrated terminal (disabled, using Snacks)
- **Snacks Terminal**: `<C-\>` to toggle

### Session Management
- **Possession**: Session save/restore

### Disabled Plugins
- vim-illuminate
- flash.nvim
- nvim-notify (using Snacks notifier)
- bufferline.nvim
- neo-tree.nvim (using Snacks explorer)

## Development Guidelines

### Adding Plugins
1. Create new file in `lua/plugins/<name>.lua`
2. Return a Lazy plugin spec table
3. Follow existing patterns for configuration

### Code Style
- Use `snake_case` for variables/functions
- Plugin specs: return table at end of file
- Use lazy.nvim's `opts` for configuration when possible
- Prefer `vim.keymap.set` over `vim.api.nvim_set_keymap`

### Customization
- Override LazyVim defaults in respective plugin files
- Add custom keymaps to `lua/config/keymaps.lua`
- Add options to `lua/config/options.lua`
- Disable plugins in `lua/plugins/disabled.lua`

## Key Files Reference

| File | Purpose |
|------|---------|
| `init.lua` | Bootstrap lazy.nvim |
| `lua/config/lazy.lua` | Plugin manager + LazyVim import |
| `lua/config/options.lua` | Vim options |
| `lua/config/keymaps.lua` | Custom keymaps |
| `lua/plugins/disabled.lua` | Disabled LazyVim plugins |
| `lua/plugins/snacks.lua` | Snacks configuration (picker, explorer, notifier) |
| `lua/plugins/colorscheme.lua` | Theme setup |
