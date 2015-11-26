" When press K, this will invoke ':help <word under cursor>'
set keywordprg=:help

" Reload .vimrc and .gvimrc automatically.
autocmd MyAutoCmd BufWritePost .vimrc,.lotusvimrc,lotusvimrc,*.rc.vim source $MYVIMRC |
      \ if has('gui_running') | source $MYGVIMRC | echo "source $MYVIMRC"
autocmd MyAutoCmd BufWritePost .gvimrc,gvimrc
      \ if has('gui_running') | source $MYGVIMRC | echo "source $MYGVIMRC"

function! Auto_VIM()
  call SetTabWidth(2)
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=Vim .<CR>
endfunction
