" -----------------------
" --- List of plugins ---
" -----------------------

call plug#begin('~/.vim/plugged')

" Aestetics 
Plug 'ghifarit53/tokyonight-vim'
Plug 'davidosomething/vim-colors-meh'
" Plug 'ajmwagar/vim-deus'
" Plug 'franbach/miramare'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'

" Add-ons to vim
Plug 'mhinz/vim-startify'

" Functionality
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'lifepillar/vim-mucomplete'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Syntax
" Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'nvim-treesitter/nvim-treesitter'

" Other pluggins
" https://github.com/itchyny/calendar.vim
" https://github.com/itchyny/vim-cursorword
" https://github.com/nvim-treesitter/nvim-treesitter

call plug#end()

" ---------------------
" --- Configuration ---
" ---------------------

" Colorscheme
" let g:tokyonight_style = 'night'
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight
" let g:meh_pandoc_enabled = 1
colorscheme meh

" Indentline
let g:indentLine_setColors = 1
let g:indentLine_char = '│'

" Markdown
let g:pandoc#spell#enabled = 0

" Lightline
let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night',
    \ 'active': {
    \   'right': [['lineinfo'], ['fileformat', 'filetype']]
    \ },
    \ 'component_function': {
    \   'filename': 'LightLineFilename'
    \ },
    \ 'component': {
    \   'lineinfo': "[l:%{printf('%03d/%03d',line('.'),line('$'))}] [c:%-v]",
    \ }
    \ }
function! LightLineFilename()
  return expand('%')
endfunction

" Startify
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']          },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'dir',       'header': ['   C. Directory '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]

let g:startify_bookmarks = [
    \ { 'wm': '~/.config/awesome/rc.lua' },
    \ { 'v': '~/.config/nvim/init.vim' },
    \ { 'al': '~/.config/alacritty/alacritty.yml' },
    \ ]

let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
    \ '   ____ _   __(_)___ ___ ',
    \ '  / __ \ | / / / __ `__ \',
    \ ' / / / / |/ / / / / / / /',
    \ '/_/ /_/|___/_/_/ /_/ /_/ ',
    \]
