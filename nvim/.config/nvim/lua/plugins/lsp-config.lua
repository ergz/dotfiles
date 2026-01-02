return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = false },
      servers = {
        ty = {
          settings = {
            ty = {
              inlayHints = {
                variableTypes = false,
                callArgumentNames = false,
              },
            },
          },
        },
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
