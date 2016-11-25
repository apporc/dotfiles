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
" neomake & syntastic
" ------------------
"let g:syntastic_echo_current_error = 1
"let g:syntastic_cursor_column = 0
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:syntastic_quiet_messages = { "level": "warnings" }
"
let g:neomake_open_list = 2
let g:neomake_serialize = 1
let g:neomake_echo_current_error = 1
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']


" disable neomake automatic behaviour.
" autocmd! BufWritePost * Neomake

nnoremap <Leader>c :Neomake<CR>
nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprevious<CR>
nnoremap <Leader>a :lfirst<CR>


" ------------------
" snippets
" ------------------
let g:UltiSnipsExpandTrigger="<m-r>"
let g:UltiSnipsJumpForwardTrigger="<m-f>"
let g:UltiSnipsJumpBackwardTrigger="<m-b>"

" ------------------
" quickfix window and help window disable keyboard shortcut
" ------------------
function! s:quickfix_my_settings()
  set nobuflisted
  setlocal number
  call Disable_window_shortcut()
endfunction
function! s:help_my_settings()
  setlocal number
  call Disable_window_shortcut()
endfunction

autocmd MyAutoCmd FileType qf call s:quickfix_my_settings()
autocmd MyAutoCmd FileType help call s:help_my_settings()
