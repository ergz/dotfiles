local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.guicursor = "n-v-c:block,i-ci-ve:ver40,r-cr:hor20,o:hor50"

opt.clipboard = "unnamedplus"
opt.conceallevel = 0
opt.mouse = "a"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 4

-- Window title for terminal/kitty tabs
opt.title = true
opt.titlestring = "nvim@%{fnamemodify(getcwd(), ':t')}"
