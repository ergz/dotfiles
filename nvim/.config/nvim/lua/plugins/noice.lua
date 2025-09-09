return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enable = true,
      view = "cmdline_popup",
    },
    views = {
      cmdline_popup = {
        border = {
          style = "rounded", -- Set border style to "single"
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
        ---@type NoiceViewOptions
        opts = {
          border = "rounded",
        },
      },
    },
  },
}
