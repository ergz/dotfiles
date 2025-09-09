-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

--- Delete keymaps --------------------------
vim.keymap.del("n", "[B")
vim.keymap.del("n", "]B")
-- vim.keymap.del("t", "<C-l>")

-- Editor keymaps ---------------------------

-- Move by blocks
-- map({ "n", "x" }, "}", "{", { desc = "Move to next block", silent = true })
-- map({ "n", "x" }, "{", "}", { desc = "Move to previous block", silent = true })

--- telescope
-- map({ "n" }, "<C-j>", require("telescope.builtin").lsp_document_symbols, { desc = "document symbols" })

-- buffer tab navigation
vim.keymap.set("n", "<A-[>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-]>", ":bnext<CR>", { noremap = true, silent = true })

-- indendation with tab
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })

--- duplicate lines
vim.api.nvim_set_keymap("n", "<C-D>", ":t.<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-D>", "y'>p", { noremap = true, silent = true })

--- show float diagnostics for current line
vim.api.nvim_set_keymap("n", "<leader>ll", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

--- move lines up and down
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Prevent dd from copying to clipboard
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "Delete line without copying" })
vim.keymap.set("x", "d", '"_d', { noremap = true, desc = "Delete selection without copying" })
--
-- -- Cut operation keymapping
-- vim.keymap.set("n", "dx", "dd", { noremap = true, desc = "Cut line" })
-- vim.keymap.set("x", "dx", "d", { noremap = true, desc = "Cut selection" })

vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle Terminal" })

-- disable
vim.keymap.set("v", "u", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>dd", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
