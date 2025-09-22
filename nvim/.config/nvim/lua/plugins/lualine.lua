local icons = LazyVim.config.icons

-- Colors for the theme
local colors = {
  bg = "#1f2023",
  line = "#2a2c32",
  fg = "#e3e3e3",
  comment = "#646477",

  keyword = "#2b8fff", -- Electric blue (normal)
  func = "#ff7700", -- Molten orange (insert)
  hint = "#8c54ff", -- Rich purple (visual)
  error = "#ff3333", -- Intense red (replace)
  warning = "#e6be8c",
  visual = "#363738",
}

-- Theme definition with MAXIMUM ENERGY! ⚡
local custom_theme = {
  normal = {
    a = { fg = "#ffffff", bg = colors.keyword, gui = "bold" },
    b = { fg = colors.fg, bg = colors.line },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = "#ffffff", bg = colors.func, gui = "bold" },
    b = { fg = colors.fg, bg = colors.line },
    c = { fg = colors.comment, bg = colors.bg },
  },
  visual = {
    a = { fg = "#ffffff", bg = colors.hint, gui = "bold" },
    b = { fg = colors.fg, bg = colors.line },
    c = { fg = colors.comment, bg = colors.bg },
  },
  replace = {
    a = { fg = "#ffffff", bg = colors.error, gui = "bold" },
    b = { fg = colors.fg, bg = colors.line },
    c = { fg = colors.comment, bg = colors.bg },
  },
  inactive = {
    a = { fg = colors.comment, bg = colors.visual, gui = "bold" },
    b = { fg = colors.comment, bg = colors.bg },
    c = { fg = colors.comment, bg = colors.bg },
  },
}

local everforest_custom_theme = {
  normal = {
    a = { fg = "#000000", bg = "#A7C080", gui = "bold" }, -- Pure black on vibrant green
    b = { fg = "#FFFFFF", bg = "#22292d", gui = "bold" }, -- White text on your suggested dark bg
    c = { fg = "#D3C6AA", bg = "#1A1E22" }, -- Even darker background for main section
  },
  insert = {
    a = { fg = "#000000", bg = "#7DCFFF", gui = "bold" }, -- Bright sky blue for insert mode
    b = { fg = "#FFFFFF", bg = "#22292d", gui = "bold" },
    c = { fg = "#D3C6AA", bg = "#1A1E22" },
  },
  visual = {
    a = { fg = "#000000", bg = "#FF9E64", gui = "bold" }, -- Bright orange for visual mode
    b = { fg = "#FFFFFF", bg = "#22292d", gui = "bold" },
    c = { fg = "#D3C6AA", bg = "#1A1E22" },
  },
  replace = {
    a = { fg = "#000000", bg = "#F7768E", gui = "bold" }, -- Hot pink/red for replace mode
    b = { fg = "#FFFFFF", bg = "#22292d", gui = "bold" },
    c = { fg = "#D3C6AA", bg = "#1A1E22" },
  },
  command = {
    a = { fg = "#000000", bg = "#BB9AF7", gui = "bold" }, -- Bright purple for command mode
    b = { fg = "#FFFFFF", bg = "#22292d", gui = "bold" },
    c = { fg = "#D3C6AA", bg = "#1A1E22" },
  },
  inactive = {
    a = { fg = "#FFFFFF", bg = "#3D484D", gui = "bold" }, -- White text for inactive mode
    b = { fg = "#AAAAAA", bg = "#22292d" },
    c = { fg = "#888888", bg = "#1A1E22" },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = "",
        component_separators = "",
        theme = custom_theme,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- NOTE: use this if want pretty relative path
          { LazyVim.lualine.pretty_path() },
          -- { "filename", path = 1 },
          -- {
          --   function()
          --     return require("nvim-treesitter").statusline({
          --       indicator_size = 70,
          --       type_patterns = { "class", "function", "method" },
          --       separator = " -> ",
          --     })
          --   end,
          -- },
        },
        lualine_z = {},
      },
    },
  },
}
