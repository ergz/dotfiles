vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "base16-*",
  callback = function()
    vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
    vim.api.nvim_set_hl(0, "@variable.python", { link = "TSParameter" })
  end,
})
