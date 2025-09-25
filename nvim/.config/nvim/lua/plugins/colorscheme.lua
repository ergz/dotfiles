return {
  {
    "ergz/hybrid.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "anysphere",
      overrides = function(highlights, colors)
        highlights["@string.documentation.python"] = { link = "Comment" }
        -- highlights["@function.builtin.python"] = { link = "Function" }
      end,
    },
  },
  { "projekt0n/github-nvim-theme", name = "github-theme", lazy = false, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    highlights = {},
  },
  {
    "tjdevries/colorbuddy.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "hybrid",
    },
  },
}
