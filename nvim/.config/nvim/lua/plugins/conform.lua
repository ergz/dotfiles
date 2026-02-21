return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        javascript = { "oxfmt" },
        typescript = { "oxfmt" },
        -- svelte = { "oxfmt" },
        typescriptreact = { "oxfmt" }, -- Add this line for TSX files
        javascriptreact = { "oxfmt" }, -- Optionally add this for JSX files
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        lua = { "stylua" },
      },
      notify_on_error = true,
      log_level = vim.log.levels.ERROR,
    },
  },
}
