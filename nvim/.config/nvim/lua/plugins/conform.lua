require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_format" },
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    json = { "oxfmt" },
    svelte = { "oxfmt" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
  notify_on_error = true,
  log_level = vim.log.levels.ERROR,
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format" })
