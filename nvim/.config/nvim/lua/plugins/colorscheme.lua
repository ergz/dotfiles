return {
  {
    "ergz/colorscheme-default.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "ergz/hybrid.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "default",
      overrides = function(hl, c)
        hl["@string.documentation.python"] = { link = "Comment" }

        -- hl.CursorLine = { bg = "#0c0c0c" }

        hl.SnacksPickerDir = { fg = c.fg_soft }
        -- hl.SnacksPickerCursorLine = { bg = c.bg_hard }
        -- hl.SnacksPickerBoxCursorLine = { bg = "#FFFFFF" }
        -- hl.SnacksPickerInputCursorLine = { bg = c.bg_hard }
        -- hl.SnacksPickerListCursorLine = { bg = c.bg }
        hl.SnacksPickerPreviewCursorLine = { bg = c.bg_hard }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neodef",
    },
  },
}
