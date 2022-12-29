-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorscheme
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Undotree
    use('mbbill/undotree')

    -- Gitsigns
    use { 'lewis6991/gitsigns.nvim' }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Indent lines
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- Comment lines
    use { 'tpope/vim-commentary' }

    -- CSS colors
    use { 'ap/vim-css-color' }

    -- Vim surround
    use { 'tpope/vim-surround' }
end)
