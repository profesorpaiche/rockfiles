" General configuration for NeoVim

" Syntax
syntax enable
filetype plugin on			        " Detects filetype from plugins
"filetype indent on			        " Set identation rules based on syntax

" Autocomplete and searching
set wildmenu				        " Allows autocompletition
set winblend=10				        " Transparency of menu windows
set completeopt=menuone,longest		" Autocomplete the most common word (longest) and show menu even with only one match (menuone)
set shortmess+=c			        " Avoid unnecessary text while using autocomplete
set incsearch                       " Highlights text while typing

" Managing splits and windows
set splitbelow
set splitright
set scrolloff=4
set sidescrolloff=10

" Line numbers
set number
set relativenumber

" Tabs/Identation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" Make it pretty
set termguicolors
set cursorline
" highlight Normal guibg=NONE ctermbg=NONE
"highlight Comment cterm=italic gui=italic
"highlight Statement gui=bold cterm=bold

" Showing tabs and other hidden characters
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set list

" Remove INSERT text
set noshowmode

" Netwr - configuracion
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
nnoremap <Leader>nt :Vexplore<CR>

" Fortran settings
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" Other settings
set path+=**				        " Looks for files anywhere
set nowrap			    	        " Display long lines as just one line
set mouse=a
set noerrorbells
set smartcase                       " does something with the case text while finding words
set noswapfile
set nobackup                        " Avoids the creation of a backup file

" Disable markdown from Polyglot
" let g:polyglot_disabled = ['markdown']
