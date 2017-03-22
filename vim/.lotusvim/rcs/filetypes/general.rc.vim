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

let g:ycm_python_binary_path = 'python'
let g:ycm_key_invoke_completion = '<m-f>'
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
\             're!\[.*\]\s'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,typescript,d,perl6,scala,vb,elixir,go' : ['.'],
\   'python' : ['.', 're!import '],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }

nnoremap <m-g> :YcmCompleter GoTo<CR>

" ------------------
" neomake
" ------------------
let g:neomake_serialize = 1
let g:neomake_echo_current_error = 1
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']


" enable neomake automatic behaviour.
autocmd! BufWritePost * Neomake

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
