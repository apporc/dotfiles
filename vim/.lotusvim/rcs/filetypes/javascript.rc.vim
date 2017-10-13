function! Auto_JS()
  call JavaScriptFold()
  setl nofen
  setl smartindent
  call SetTabWidth(2)
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=Javascript .<CR>
endfunction
