-- Keymaps modified from Chris@Machine
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------
-- Normal --
------------

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- File navigation
-- keymap("n", "<leader>nv", ":Vexplore<CR>", opts)
keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<Leader>ft", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<Leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", opts)
keymap("n", "<Leader>fe", ":Telescope file_browser<CR>", opts)
keymap("n", "<leader>e", ":Lex 30<cr>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Stop F1 to be annoying
keymap("n", "<F1>", "<Esc>", opts)

-- Plantillas
keymap("n", ",Rmd", ":-1read $HOME/.vim/plantillas/pl_mitra.Rmd<CR>", opts)
keymap("n", ",r", ":-1read $HOME/.vim/plantillas/pl_mitra.r<CR>", opts)
keymap("n", ",jl", ":-1read $HOME/.vim/plantillas/pl_mitra.jl<CR>", opts)

-- Enable or disable limit vertical line
keymap("n", "<Leader>nvl", "UnsetGutter()<CR>", opts)
keymap("n", "<Leader>vl", "SetGutter()<CR>", opts)

-- Spellcheck
keymap("n", "<Leader>spe", ":setlocal spell spelllang=es<CR>", opts)
keymap("n", "<Leader>spi", ":setlocal spell spelllang=en<CR>", opts)
keymap("n", "<Leader>spa", ":setlocal spell spelllang=es,en<CR>", opts)
keymap("n", "<Leader>spx", ":set nospell<CR>", opts)

-- Remove highlight
keymap("n", "<Leader>nh", ":noh<CR>", opts)

------------
-- Insert --
------------

-- Change Esc
-- keymap("i", "jk", "<ESC>", opts)
keymap("i", "<F1>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Delete selection
keymap("v", "p", '"_dP', opts)

-- Mapping yank and paste to clipboard
keymap("v", "<Leader>y", '"+y', opts)
keymap("v", "<Leader>p", '"+p', opts)

------------------
-- Visual Block --
------------------

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--------------
-- Terminal --
--------------

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

---------------------
-- Pluggin related --
---------------------

