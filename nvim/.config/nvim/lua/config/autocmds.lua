local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "base16-*", -- This will match only when base16-chalk is loaded
  callback = function()
    vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
    vim.api.nvim_set_hl(0, "@variable.python", { link = "TSParameter" })
  end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = augroup("custom_highlights"),
--   callback = function()
--     vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#00b08d" })
--   end,
-- })

-- autocmd for yank color
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = vim.api.nvim_create_augroup("custom_highlights", { clear = true }),
--   callback = function()
--     vim.api.nvim_set_hl(0, "IncSearch", {
--       bg = "#00b08d", -- Aqua color
--       fg = "#22292D", -- Keeping your original foreground
--       ctermbg = 114, -- Terminal color for aqua
--       ctermfg = 235, -- Keeping your original terminal foreground
--     })
--   end,
-- })
