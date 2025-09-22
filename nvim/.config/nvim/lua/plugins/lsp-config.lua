return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = false },
      servers = {
        ty = false,
        pyright = {},
        ts_ls = {},
        svelte = {},
        ruff_lsp = false,
        clangd = {},
        gopls = false,
      },
    },
  },
}
