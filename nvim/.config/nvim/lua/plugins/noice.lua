return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enable = true,
      -- view = "cmdline",
    },
    views = {
      hover = {
        border = {
          style = "rounded",
        },
      },
      cmdline_popup = {
        border = {
          style = "rounded",
          padding = { 0, 0 },
        },
      },
      popupmenu = {
        border = {
          style = "rounded",
          padding = { 0, 0 },
        },
      },
    },
    lsp = {
      hover = {
        view = "hover",
      },
    },
  },
}
