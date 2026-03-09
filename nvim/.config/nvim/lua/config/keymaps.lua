vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Better escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- File explorer (built-in netrw)
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without losing register
map("x", "<leader>p", '"_dP', { desc = "Paste without losing clipboard" })

-- Copy to system clipboard
map("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Delete without yanking
map("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
map("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
