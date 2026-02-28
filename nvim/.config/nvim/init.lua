-- ~/.config/nvim/init.lua

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Basic sane defaults
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP
  { "neovim/nvim-lspconfig" },

  -- Completion (manual trigger)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
})

-- LSP: Pyright
vim.lsp.enable("pyright")

-- Completion: only when requested (no auto popup)
local cmp = require("cmp")
cmp.setup({
  completion = { autocomplete = false },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),        -- manual completion
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Esc>"] = cmp.mapping.abort(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Handy LSP keymaps (Vim-style)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Manual linting helpers (Ruff)
vim.keymap.set("n", "<leader>rc", function()
  vim.cmd("write")
  vim.cmd("terminal ruff check %")
end)

vim.keymap.set("n", "<leader>rf", function()
  vim.cmd("write")
  vim.cmd("terminal ruff format %")
end)



















