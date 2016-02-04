function! Auto_DOT()
  call SetTabWidth(2)
  noremap <buffer><leader>v :GraphvizInteractive<CR>
endfunction

