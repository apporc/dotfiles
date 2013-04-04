"minibuf settings
"----------------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplModSelTarget = 1 
let g:statusLineText = ""

nmap <leader>n <ESC>:MBEbn<CR>
nmap <leader>p <ESC>:MBEbp<CR>

"This will not work when in terminal version vim
"let g:miniBufExplMapCTabSwitchBufs = 1 
"nnoremap <c-tab> :MBEbn<CR>
"nnoremap <c-s-tab> :MBEbp<CR>
