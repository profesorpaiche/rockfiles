" Setting keybindings

" Leader key
let mapleader = " "

" Copy and paste
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p

" Plantillas
nnoremap ,Rmd :-1read $HOME/.vim/plantillas/pl_mitra.Rmd<CR>
nnoremap ,r :-1read $HOME/.vim/plantillas/pl_mitra.r<CR>

" Enable or disable limit vertical line
noremap <Leader>nvl :call UnsetGutter()<CR>
noremap <Leader>vl :call SetGutter()<CR>

" Spellcheck
nnoremap <Leader>spe :setlocal spell spelllang=es<CR>
nnoremap <Leader>spi :setlocal spell spelllang=en<CR>
nnoremap <Leader>spa :setlocal spell spelllang=es,en<CR>
nnoremap <Leader>spx :set nospell<CR>

" Reselect after indentation
vmap < <gv
vmap > >gv

" Remove last highlight
nnoremap <Leader>nh :noh<CR>

" Easymotion 
" let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-f)
" nmap f <Plug>(easymotion-overwin-f)
