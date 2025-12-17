return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = false },
      servers = {
        ty = {},
        pyright = false,
        ts_ls = {},
        svelte = {},
        ruff_lsp = false,
        clangd = {},
        gopls = false,
        lua_ls = {},
      },
    },
  },
}
