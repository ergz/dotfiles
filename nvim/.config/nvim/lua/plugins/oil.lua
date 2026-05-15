require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["<C-s>"] = false,
    ["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
  },
  view_options = { show_hidden = true },
  confirmation = { border = "rounded" },
})
