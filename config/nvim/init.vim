
" ============================================================================ "
" Pluggins
" ============================================================================ "

call plug#begin('~/.vim/plugged')

" Líneas de indentación
Plug 'Yggdroot/indentLine'
" Barra de estado
Plug 'itchyny/lightline.vim'
" Colores en código
Plug 'ap/vim-css-color'
" Íconos
Plug 'ryanoasis/vim-devicons'
" Rmarkdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Startify
Plug 'mhinz/vim-startify'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vimwiki
Plug 'vimwiki/vimwiki'
" vim-commentary
Plug 'tpope/vim-commentary'
"Easymotion
Plug 'easymotion/vim-easymotion'
" vim-polyglot
Plug 'sheerun/vim-polyglot'

" Esquema de colores
Plug 'ajmwagar/vim-deus'
Plug 'relastle/bluewery.vim'
Plug 'cocopon/iceberg.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'wadackel/vim-dogrun'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'Shadorain/shadotheme'
Plug 'ghifarit53/tokyonight-vim'
Plug 'heraldofsolace/nisha-vim'
Plug 'franbach/miramare'

call plug#end()

" Other pluggins
" https://github.com/lifepillar/vim-mucomplete
" https://github.com/hrsh7th/nvim-cmp
" https://github.com/tpope/vim-surround
" https://github.com/preservim/tagbar
" https://github.com/nvim-telescope/telescope.nvim

" ============================================================================ "
" General Configuration
" ============================================================================ "

" Code syntax
syntax on
filetype plugin on

" Finding files
set path+=**
set wildmenu

" Autocomplete
set completeopt=menuone,longest
set shortmess+=c

" Length of text
function! SetGutter()
  set tw=81
  set colorcolumn=+1
endfunction

function! UnsetGutter()
  set tw=0
  set colorcolumn=0
endfunction

" Fortran
let fortran_free_source = 1
let fortran_have_tabs = 1
let fortran_more_precise = 1
let fortran_do_enddo = 1

" Activate mouse
set mouse=a

" Splits management
set splitbelow
set splitright

" Line numbers
set nu
set relativenumber

" Scroll
set scrolloff=4

" Save current mouse position
set viminfo='10,\"100,:20,%,n~/.config/nvim/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
filetype indent on

" Extras
set noerrorbells
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" ============================================================================ "
" General key bindings
" ============================================================================ "

" Leader key
map . <Nop>
let mapleader = "."

" Copy and paste
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p

" Splits movement
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Plantillas
nnoremap ,Rmd :-1read $HOME/.vim/plantillas/pl_mitra.Rmd<CR>
nnoremap ,r :-1read $HOME/.vim/plantillas/pl_mitra.r<CR>ggj

" Enable or disable auto width-formatting.
noremap <leader>g :call UnsetGutter()<CR>
noremap <leader>G :call SetGutter()<CR>

" Spellcheck
nnoremap <Leader>spe :setlocal spell spelllang=es<CR>
nnoremap <Leader>spi :setlocal spell spelllang=en<CR>
nnoremap <Leader>spa :setlocal spell spelllang=es,en<CR>
nnoremap <Leader>spx :set nospell<CR>

" fzf
nmap // :BLines<CR>

" Startify
nnoremap <Leader>S :tabnew<CR>:Startify<CR>

" Reselect after identation
vmap < <gv
vmap > >gv

" No highlighting search
nnoremap <Leader>nh :noh<CR>

" ============================================================================ "
" Autocommands
" ============================================================================ "

" Unfold Markdown
autocmd FileType markdown normal zR
autocmd FileType rmarkdown normal zR

" ============================================================================ "
" Pluggins configuration 
" ============================================================================ "

" Color scheme
set termguicolors

" Miramare
" Fix brackets as: https://github.com/franbach/miramare/issues/17
" let g:miramare_enable_italic = 1
" let g:miramare_disable_italic_comment = 1
" colorscheme miramare

" Deus
" colorscheme deus

" colorscheme apprentice
" colorscheme bluewery
" colorscheme iceberg
" colorscheme meh
" let g:meh_pandoc_enabled = 1
" colorscheme dogrun

" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
" colorscheme spaceduck

" colorscheme xshado

" Tokyonight
let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
" let g:tokyonight_disable_italic_comment = 0
colorscheme tokyonight

" colorscheme nisha

set cursorline

" Special highlight
" highlight Statement gui=bold cterm=bold
highlight Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic

" lightline
let g:lightline = {
    \ 'colorscheme': 'tokyonight',
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

" Identation
let g:indentLine_char = '│'
let g:indentLine_setConceal = 1
let g:indentLine_setColors = 1
let g:indentLine_showFirstIndentLevel = 0

" Let indentLine use current conceal options
" use it when indentLine_setConceal = 0
" let g:indentLine_conceallevel  = &conceallevel
" let g:indentLine_concealcursor = &concealcursor

" Markdown
let g:pandoc#spell#enabled = 0
let g:pandoc#keyboard#use_default_mappings = 0
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#blacklist = ['block']

" let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Netwr - configuracion
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
nnoremap <Leader>nt :Vexplore<CR>

" Startify
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']          },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'dir',       'header': ['   C. Directory '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

let g:startify_bookmarks = [
    \ { 'c': '~/.config/qtile/config.py' },
    \ { 'v': '~/.config/nvim/init.vim' },
    \ { 'al': '~/.config/alacritty/alacritty.yml' },
    \ ]

let g:startify_commands = [
    \ { 'w': 'VimwikiIndex'},
    \ ]

let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
    \ '   ____ _   __(_)___ ___ ',
    \ '  / __ \ | / / / __ `__ \',
    \ ' / / / / |/ / / / / / / /',
    \ '/_/ /_/|___/_/_/ /_/ /_/ ',
    \]

" Vimwiki
" from help vimwiki
function! VimwikiLinkHandler(link)
" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
"   1) [[vfile:~/Code/PythonProject/abc123.py]]
"   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        exe 'tabnew ' . fnameescape(link_infos.filename)
        return 1
    endif
endfunction

let g:vimwiki_global_ext = 0
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

