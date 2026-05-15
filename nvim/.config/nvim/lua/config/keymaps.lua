local map = vim.keymap.set
local root = require("config.root")

-- Buffer navigation & file management
map("n", "<A-[>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<A-]>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>`", "<cmd>b#<cr>", { desc = "Switch to other buffer" })
map("n", "<leader>dd", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map({ "i", "v", "x" }, "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save file" })

-- Text editing
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })
map("n", "<Tab>", ">>", { desc = "Indent line" })
map("n", "<S-Tab>", "<<", { desc = "Outdent line" })

map("n", "<C-D>", "<cmd>t.<cr>", { desc = "Duplicate line" })
map("v", "<C-D>", "y'>p", { desc = "Duplicate selection" })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

map("n", "<D-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("n", "<D-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

map("n", "dd", '"_dd', { desc = "Delete line without copying" })
map("x", "d", '"_d', { desc = "Delete selection without copying" })

-- Diagnostics
map("n", "<leader>ll", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Snacks-powered UI
map({ "n", "t" }, "<c-\\>", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle terminal" })

map({ "n", "t" }, "<D-\\>", function()
  Snacks.picker.explorer({ cwd = root.get() })
end, { desc = "Explorer root" })

map({ "n", "t" }, "<A-\\>", function()
  Snacks.picker.explorer({ cwd = root.get() })
end, { desc = "Explorer root" })

map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File explorer" })

map("n", "<leader>p", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<C-p>", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader><space>", function()
  Snacks.picker.files()
end, { desc = "Find files" })

map("n", "<leader>ss", function()
  Snacks.picker.smart()
end, { desc = "Smart find" })

map("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find config file" })

-- Disabled keys
map("v", "u", "<Nop>", { silent = true })
map("n", "q", "<Nop>", { silent = true })
