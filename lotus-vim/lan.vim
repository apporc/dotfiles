function! Auto_C()
  setl fdm=syntax
  call SetTabWidth(4)
  setl omnifunc=ccomplete#Complete
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=C,C++ . && cscope -R -b -q -s .<CR>
  silent source ~/.lotus_vim/cscope.vim
endfunction

function! Auto_CSS()
  call SetTabWidth(2)
  setl omnifunc=csscomplete#CompleteCS
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=HTML .<CR>
endfunction

function! Auto_HTML()
  call SetTabWidth(2)
  setl omnifunc=htmlcomplete#CompleteTags
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=HTML .<CR>
endfunction

function! Auto_JS()
  setl fen
  setl nocindent
  call JavaScriptFold()
  call SetTabWidth(4)
  setl omnifunc=javascriptcomplete#CompleteJS
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Javascript .<CR>
endfunction

function! Auto_PHP()
  setl fdm=syntax
  call SetTabWidth(4)
  setl omnifunc=phpcomplete#Complete
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=php .<CR>
endfunction

function! Auto_PYTHON()
  call SetTabWidth(4)
  call DeleteTrailingWS()
  setl fdm=indent
  " disable intelligent indentation for python, or the cursor magically show at the head of one new line when commenting.
  setl nosmartindent
  setl omnifunc=pythoncomplete#Complete
  "This silent won't work, don't know why.
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python . && pycscope -R .<CR>
  silent source ~/.lotus_vim/cscope.vim
endfunction

function! Auto_SH()
  call SetTabWidth(2)
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=sh .<CR>
endfunction

function! Auto_VIM()
  call SetTabWidth(2)
  map <buffer> <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Vim .<CR>
endfunction



"Identify languge types
"----------------------------
augroup MyAutoCmd
  autocmd Filetype c silent call Auto_C()
  autocmd Filetype cpp silent call Auto_C()
  autocmd Filetype python silent call Auto_PYTHON()
  autocmd Filetype sh silent call Auto_SH()
  autocmd Filetype js silent call Auto_JS()
  autocmd Filetype html silent call Auto_HTML()
  autocmd Filetype css silent call Auto_CSS()
  autocmd Filetype vim silent call Auto_VIM()
  autocmd Filetype php silent call Auto_PHP()
augroup END
