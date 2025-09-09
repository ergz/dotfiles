return {
  "ibhagwan/fzf-lua",
  opts = {
    fzf_opts = {
      ["--cycle"] = "",
    },
    files = {
      file_icons = true,
    },
    buffers = {
      file_icons = true,
    },
    keymaps = {
      ["<leader>,"] = false,
      ["<leader>space"] = false,
    },
  },
  -- keys = {
  -- { "<leader>ss", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
  -- { "<C-p>", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" } },
  -- { "<leader>p", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },

  -- {
  --   "<C-j>",
  --   function()
  --     require("fzf-lua").lsp_document_symbols({
  --       regex_filter = symbols_filter,
  --     })
  --   end,
  --   desc = "Goto Symbol",
  -- },
  -- },
}
