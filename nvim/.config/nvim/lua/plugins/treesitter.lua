local treesitter = require("nvim-treesitter")

local parsers = {
  "bash",
  "c",
  "cpp",
  "go",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "odin",
  "python",
  "query",
  "svelte",
  "swift",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}

if vim.fn.executable("tree-sitter") == 1 then
  treesitter.install(parsers)
else
  vim.notify("tree-sitter CLI not found; install it with `brew install tree-sitter` to build parsers", vim.log.levels.WARN)
end

vim.api.nvim_create_user_command("TSInstallConfigured", function()
  treesitter.install(parsers)
end, { desc = "Install configured Treesitter parsers" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
