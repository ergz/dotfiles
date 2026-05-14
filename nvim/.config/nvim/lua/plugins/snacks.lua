local helix_layout = {
  layout = {
    box = "horizontal",
    width = 0.8,
    min_width = 120,
    height = 0.8,
    border = "single",
    title = "{source}",
    title_pos = "right",
    {
      box = "vertical",
      border = "none",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
    { win = "preview", title = "{preview}", border = "left", width = 0.5 },
  },
}

require("snacks").setup({
  picker = {
    enabled = true,
    ui_select = true,
    layout = helix_layout,
    sources = {
      files = { hidden = true, ignored = false, layout = helix_layout, icons = { files = { enabled = false } } },
      smart = { layout = helix_layout, icons = { files = { enabled = false } } },
      grep = { layout = helix_layout },
      lsp_symbols = { layout = helix_layout },
      buffers = {
        layout = helix_layout,
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
    scope = { underline = true },
    chunk = { enabled = true, char = { arrow = "─" } },
  },
  terminal = { enabled = true },
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
