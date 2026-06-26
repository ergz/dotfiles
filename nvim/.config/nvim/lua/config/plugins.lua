if not vim.pack then
  error("This config requires Neovim 0.12+ for vim.pack")
end

vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/Saghen/blink.lib" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/serhez/teide.nvim" },
})

require("plugins.colorscheme")
require("plugins.snacks")
require("plugins.oil")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.mini_pairs")
require("plugins.lualine")
require("plugins.which_key")
require("plugins.todo_comments")
require("plugins.trouble")
