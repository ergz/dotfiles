require("snacks").setup({
  picker = {
    enabled = true,
    ui_select = true,
    sources = {
      files = { hidden = true, ignored = false, icons = { files = { enabled = false } } },
      smart = { icons = { files = { enabled = false } } },
      buffers = {
        current = false,
        sort_lastused = true,
        win = {
          input = { keys = { ["dd"] = "bufdelete", ["<c-x>"] = { "bufdelete", mode = { "n", "i" } } } },
          list = { keys = { ["dd"] = "bufdelete" } },
        },
      },
      explorer = { auto_close = true, hidden = true, watch = true },
    },
    win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
  },
  input = { enabled = true },
  notifier = { enabled = true, padding = false, style = "compact", win = { border = "single" } },
  indent = {
    enabled = true,
    indent = { char = "│" },
    animate = {
      style = "out",
      easing = "linear",
      duration = {
        total = 200,
      },
    },
    scope = { underline = true },
    chunk = { enabled = true, char = { arrow = "─" } },
  },
  terminal = {
    enabled = true,
    win = {
      position = "right",
      width = 0.4,
      height = 0,
    },
  },
  lazygit = {
    theme = {
      selectedLineBgColor = { bg = "Normal", bold = false },
      activeBorderColor = { fg = "String" },
      inactiveBorderColor = { fg = "Comment" },
      defaultFgColor = { fg = "Normal", bold = false },
    },
  },
  styles = {
    notification = { border = "single" },
    input = { border = "single" },
    notification_history = { border = "single" },
  },
})

local picker_border = "#81A2BE"
for _, group in ipairs({
  "SnacksPickerBorder",
  "SnacksPickerBoxBorder",
  "SnacksPickerInputBorder",
  "SnacksPickerListBorder",
  "SnacksPickerPreviewBorder",
}) do
  vim.api.nvim_set_hl(0, group, { fg = picker_border })
end

vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = "#F0C674", bold = true })
