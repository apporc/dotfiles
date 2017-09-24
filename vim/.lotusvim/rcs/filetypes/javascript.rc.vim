function! Auto_JS()
  setl fen
  setl nocindent
  call JavaScriptFold()
  call SetTabWidth(2)
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=Javascript .<CR>
endfunction
