return {
  {
    "ergz/colorscheme-default.nvim",
    lazy = false,
    priority = 1000,
    name = "neodef",
    opts = {
      overrides = { Comment = { italic = true } },
      mood = "default",
    },
  },
  { "blazkowolf/gruber-darker.nvim" },
  -- Lazy
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
  },
  { "ergz/hybrid.nvim", lazy = false, priority = 1000, opts = { italic = { comments = false } } },

  -- to test locally
  -- {
  --   dir = "/Users/erodriguez/code/misc/colorscheme-default.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "neodef",
  --   opts = {
  --     mood = "default",
  --     overrides = {
  --       Comment = { italic = true },
  --     },
  --   },
  -- },
  {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "teide",
    },
  },
}
