return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" }, -- Add this line for TSX files
        javascriptreact = { "prettierd" }, -- Optionally add this for JSX files
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
      },
      notify_on_error = true,
      log_level = vim.log.levels.ERROR,
    },
  },
}
