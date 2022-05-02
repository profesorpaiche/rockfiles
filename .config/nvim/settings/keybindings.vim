" Setting keybindings

" Unmap F1
map <F1> <Esc>
imap <F1> <Esc>

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
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Startify
nnoremap <leader>S :tabnew<CR>:Startify<CR>

" Explorer
nnoremap <Leader>nt :Vexplore<CR>
