local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- Backups / undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Performance
opt.updatetime = 50

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split behavior
opt.splitright = true
opt.splitbelow = true
