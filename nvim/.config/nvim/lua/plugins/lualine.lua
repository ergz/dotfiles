local root = require("config.root")

local function relative_path()
  local name = vim.api.nvim_buf_get_name(0)

  if vim.bo.filetype == "oil" then
    name = name:gsub("^oil:///*", "/")
  end

  if name == "" then
    return "[No Name]"
  end

  local project_root = root.get()
  local relative = vim.fs.relpath(project_root, name)
  return relative or vim.fn.fnamemodify(name, ":~:.")
end

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
      relative_path,
    },
    lualine_z = {},
  },
})
