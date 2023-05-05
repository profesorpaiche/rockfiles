-- Autocomplete
vim.opt.wildmenu = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.winblend = 10
vim.opt.pumheight = 10
vim.opt.shortmess:append "c"
-- vim.opt.whichwrap:append "<,>,[,],h,l"

-- Line options
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.wrap = false

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Indentation
vim.opt.autoindent = true

-- Backup and undo file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Good colors
vim.opt.termguicolors = true

-- Buffer movement
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Window decoration
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 2

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Make it faster
vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000

-- Command prompt
vim.opt.showmode = false

-- Better yanking
vim.opt.clipboard = "unnamedplus"

-- Diable folding
vim.opt.foldenable = false

-- Adding EOL character
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
