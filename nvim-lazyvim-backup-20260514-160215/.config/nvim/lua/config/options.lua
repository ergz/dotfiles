-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff"

local opt = vim.opt

opt.guicursor = "n-v-c:block,i-ci-ve:ver40,r-cr:hor20,o:hor50"

opt.relativenumber = false
vim.opt.conceallevel = 0
opt.clipboard = "unnamedplus"
vim.g.snacks_animate = true
vim.g.lazyvim_picker = "snacks"

-- opt.scrolloff = 999

-- Window title for terminal/kitty tabs
opt.title = true
opt.titlestring = "nvim@%{fnamemodify(getcwd(), ':t')}"
