local M = {}

M.markers = {
  ".git",
  "package.json",
  "pyproject.toml",
  "go.mod",
  "Cargo.toml",
  "Makefile",
}

function M.get(buf)
  buf = buf or 0
  local path = vim.api.nvim_buf_get_name(buf)
  if path == "" then
    path = vim.uv.cwd()
  end
  return vim.fs.root(path, M.markers) or vim.uv.cwd()
end

return M
