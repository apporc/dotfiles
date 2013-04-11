"minibuf settings
"----------------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplModSelTarget = 1 
let g:statusLineText = "MINIBUFEXPLORER"

nmap <leader>n <ESC>:MBEbn<CR>
nmap <leader>p <ESC>:MBEbp<CR>

"This will not work when in terminal version vim
"let g:miniBufExplMapCTabSwitchBufs = 1 
"nnoremap <c-tab> :MBEbn<CR>
"nnoremap <c-s-tab> :MBEbp<CR>
"
"" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
for buffer_no in range(1, 9)
  execute "nmap <Leader>" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor

" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
for buffer_no in range(10, 100)
  execute "nmap <Leader>0" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor
