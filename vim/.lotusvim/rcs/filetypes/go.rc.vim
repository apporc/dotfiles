function! Auto_GO()
  call SetTabWidth(4)
  " not use ctags/cscop for golang for now.
  map <m-g> <Nop>
  nnoremap <m-g> :GoDef<CR>
  " noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=go .<CR>
  map <leader>d <Nop>
  nmap <leader>r <Plug>(go-run)
  nmap <leader>b <Plug>(go-build)
  nmap <leader>t <Plug>(go-test)
  nmap <leader>c <Plug>(go-coverage)
  nmap <Leader>ds <Plug>(go-def-split)
  nmap <Leader>dv <Plug>(go-def-vertical)
  nmap <Leader>dt <Plug>(go-def-tab)
  nmap <Leader>gd <Plug>(go-doc)
  nmap <Leader>gv <Plug>(go-doc-vertical)
  nmap <Leader>s <Plug>(go-implements)
  nmap <Leader>i <Plug>(go-info)
  nmap <Leader>e <Plug>(go-rename)
endfunction

" ------------------
" vim-go
" ------------------
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

