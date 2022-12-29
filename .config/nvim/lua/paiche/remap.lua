vim.g.mapleader = " "

-- Openning Netrw
vim.keymap.set("n", "<leader>ed", vim.cmd.Ex)
vim.keymap.set("n", "<leader>es", vim.cmd.Lex)

-- Moving selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Retaing cursor in the same position
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Retain copied text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Send copied text to register +
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Eliminate Q
vim.keymap.set("n", "Q", "<nop>")

-- Replacing the word you are on
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Stop F1 to be annoying
vim.keymap.set("n", "<F1>", "<Esc>")
vim.keymap.set("i", "<F1>", "<Esc>")

-- Plantillas
vim.keymap.set("n", "<leader>,Rmd", ":-1read $HOME/.vim/plantillas/pl_mitra.Rmd<CR>")
vim.keymap.set("n", "<leader>,r", ":-1read $HOME/.vim/plantillas/pl_mitra.r<CR>")
vim.keymap.set("n", "<leader>,jl", ":-1read $HOME/.vim/plantillas/pl_mitra.jl<CR>")

-- Spell check
vim.keymap.set("n", "<leader>spe", ":setlocal spell spelllang=es<CR>")
vim.keymap.set("n", "<leader>spi", ":setlocal spell spelllang=en<CR>")
vim.keymap.set("n", "<leader>spa", ":setlocal spell spelllang=es,en<CR>")
vim.keymap.set("n", "<leader>spx", ":set nospell<CR>")

-- Stay in visual mode after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
