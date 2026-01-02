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
          style = "single",
        },
      },
      cmdline_popup = {
        border = {
          style = "single",
          padding = { 0, 0 },
        },
      },
      popupmenu = {
        border = {
          style = "single",
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
