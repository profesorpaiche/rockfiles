" Personal functions

" Length of text
function! SetGutter()
  set tw=81
  set colorcolumn=+1
endfunction

function! UnsetGutter()
  set tw=0
  set colorcolumn=0
endfunction

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

" Unfold Markdown
autocmd FileType markdown normal zR
autocmd FileType rmarkdown normal zR

