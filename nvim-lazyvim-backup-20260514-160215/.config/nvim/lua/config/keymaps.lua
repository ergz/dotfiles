-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = LazyVim.safe_keymap_set

-- Delete default keymaps
vim.keymap.del("n", "[B")
vim.keymap.del("n", "]B")

--- Buffer Navigation & File Management
vim.keymap.set("n", "<A-[>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-]>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--- Text Editing
-- Indentation
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })

-- Duplicate lines
vim.api.nvim_set_keymap("n", "<C-D>", ":t.<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-D>", "y'>p", { noremap = true, silent = true })

-- Move lines (Alt)
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move lines (Mac Cmd)
vim.api.nvim_set_keymap("n", "<D-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Delete without copying
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "Delete line without copying" })
vim.keymap.set("x", "d", '"_d', { noremap = true, desc = "Delete selection without copying" })

--- Tools & Diagnostics
-- Terminal
vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle Terminal" })

-- Float diagnostics
vim.api.nvim_set_keymap("n", "<leader>ll", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

--- Disabled Keys
vim.keymap.set("v", "u", "<Nop>", { silent = true }) -- Disable undo in visual
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true }) -- Disable macros
