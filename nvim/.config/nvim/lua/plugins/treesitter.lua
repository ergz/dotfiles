return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  opts = {
    ensure_installed = { "svelte", "swift" },
    -- highlight = { enable = true, disable = { "python", "c", "go" } },
    highlight = { enable = true },
  },
}
