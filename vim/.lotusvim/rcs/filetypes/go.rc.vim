function! Auto_GO()
  call SetTabWidth(4)
  " not use ctags/cscop for golang for now.
  noremap <m-g> <Nop>
  nnoremap <m-g> :GoDef<CR>
  " noremap <buffer> <silent> <F5> :!ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=go .<CR>
  noremap <leader>d <Nop>
  nnoremap <leader>r :GoRun %<CR>
  nnoremap <leader>b :GoBuild %<CR>
  nnoremap <leader>t :GoTest<CR>
  nnoremap <leader>c :GoCoverage<CR>
  nnoremap <Leader>ds :GoDefSplit<CR>
  nnoremap <Leader>dv <Plug>(go-def-vertical)
  nnoremap <Leader>dt <Plug>(go-def-tab)
  nnoremap <Leader>gd <Plug>(go-doc)
  nnoremap <Leader>gv <Plug>(go-doc-vertical)
  nnoremap <Leader>s <Plug>(go-implements)
  nnoremap <Leader>i <Plug>(go-info)
  nnoremap <Leader>e <Plug>(go-rename)
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

