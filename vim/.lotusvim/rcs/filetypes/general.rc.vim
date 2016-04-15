" ------------------
"  YouCompleteMe
"  -----------------
" YCM's identifier completer will also collect identifiers from tags files.
" let g:ycm_collect_identifiers_from_tags_files = 1
 let g:ycm_filetype_blacklist = {
       \ 'notes' : 1,
       \ 'markdown' : 1,
       \ 'text' : 1,
       \ 'unite' : 1
       \}

" ------------------
" syntastic
" ------------------
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_column = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_quiet_messages = { "level": "warnings" }

nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprevious<CR>
nnoremap <Leader>el :Errors<CR>
