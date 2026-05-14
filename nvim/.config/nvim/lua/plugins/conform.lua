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
  notify_on_error = true,
  log_level = vim.log.levels.ERROR,
})
