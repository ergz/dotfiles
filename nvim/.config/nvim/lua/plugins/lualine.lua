local root = require("config.root")

require("lualine").setup({
  options = {
    section_separators = "",
    component_separators = "",
    theme = "auto",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      function()
        return vim.fn.fnamemodify(root.get(), ":t")
      end,
      "diagnostics",
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1 },
    },
    lualine_z = {},
  },
})
