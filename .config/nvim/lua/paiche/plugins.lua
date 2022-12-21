local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Package manager
    use "wbthomason/packer.nvim"                        -- Have packer manage itself

    -- Basic Lua functionality
    use "nvim-lua/plenary.nvim"                         -- Useful lua functions used in lots of plugins
    use "nvim-lua/popup.nvim"                           -- An implementation of the Popup API from vim in Neovim

    -- Autopairs
    use "windwp/nvim-autopairs"                         -- Integrates autopairs.

    -- Colorschemes
    use "arcticicestudio/nord-vim"                      -- Nord color scheme
    use "folke/tokyonight.nvim"                         -- Tokyonight color scheme

    -- Autocompletion
    use "hrsh7th/nvim-cmp"                              -- The completion plugin
    use "hrsh7th/cmp-buffer"                            -- Buffer completions
    use "hrsh7th/cmp-path"                              -- Path completions
    use "hrsh7th/cmp-cmdline"                           -- Command line completions
    use "hrsh7th/cmp-nvim-lsp"                          -- completions for LSP
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip"                              -- Snippet engine
    use "rafamadriz/friendly-snippets"                  -- A bunch of snippets
    use "saadparwaiz1/cmp_luasnip"                      -- Snippet completions

    -- LSP
    use "neovim/nvim-lspconfig"                         -- Enable LSP
    use "williamboman/nvim-lsp-installer"               -- Instalation package

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    -- use "p00f/nvim-ts-rainbow"            -- Add colors to the parenthesis

    -- Telescope
    use "nvim-telescope/telescope.nvim"                 -- Vim telescope
    use "nvim-telescope/telescope-media-files.nvim"     -- See media files in Telescope
    use "nvim-telescope/telescope-file-browser.nvim"    -- File Browser version

    -- Git
    use "lewis6991/gitsigns.nvim"                       -- Adds signs for git

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- CSS colors
    use "ap/vim-css-color"

    -- Indent lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Functionality
    use "tpope/vim-commentary"                          -- Quick keybindings for commenting text
    use "tpope/vim-surround"                            -- Add surrounding texts
    use "airblade/vim-rooter"                           -- Change working directory

    -- Additionals
    -- https://github.com/f3fora/cmp-spell
    -- https://github.com/jc-doyle/cmp-pandoc-references
    -- https://github.com/rockerBOO/awesome-neovim

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
