function! Auto_PYTHON()
  call SetTabWidth(4)
  setl fdm=indent
  " disable intelligent indentation for python, or the cursor magically show at the head of one new line when commenting.
  setl nosmartindent
  "This silent won't work, don't know why.
  noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=Python . && pycscope -R -f .cscope .<CR>
  silent source ~/.lotusvim/rcs/cscope.rc.vim
endfunction

" ------------------
"  virtualenv
" ------------------

"TODO now is checking openstack's code, use this at present.
let g:virtualenv_directory = '.tox/'

" ----------------
"  python-mode
" ----------------
let g:pymode_rope_goto_definition_bind = "<m-g>"
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 80
let g:pymode_virtualenv = 1
let g:pymode_run = 0
let g:pymode_run_bind = ''
