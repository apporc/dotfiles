function! Auto_PHP()
  setl fdm=syntax
  call SetTabWidth(4)
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=php .<CR>
endfunction
