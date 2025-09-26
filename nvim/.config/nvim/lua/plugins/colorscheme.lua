return {
  {
    "ergz/hybrid.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "anysphere",
      overrides = function(hl, c)
        hl["@string.documentation.python"] = { link = "Comment" }

        hl.SnacksPickerDir = { fg = c.fg_soft }
        -- hl.SnacksPickerCursorLine = { bg = c.bg_hard }
        -- hl.SnacksPickerBoxCursorLine = { bg = "#FFFFFF" }
        -- hl.SnacksPickerInputCursorLine = { bg = c.bg_hard }
        hl.SnacksPickerListCursorLine = { bg = c.bg }
        hl.SnacksPickerPreviewCursorLine = { bg = c.bg_hard }
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
