function! Auto_HTML()
  call SetTabWidth(2)
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=HTML .<CR>
endfunction
