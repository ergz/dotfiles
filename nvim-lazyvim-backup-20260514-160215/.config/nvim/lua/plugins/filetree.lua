return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      keymaps = {
        ["<C-s>"] = false,
        ["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
      },
      view_options = { show_hidden = true },
      confirmation = {
        border = "rounded", -- Enables a rounded border for confirmations
      },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
