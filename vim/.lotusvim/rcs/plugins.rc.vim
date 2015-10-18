function! Disable_window_shortcut() "{{{
  nnoremap <buffer><m-x> <Nop>
  nnoremap <buffer><m-t> <Nop>
  nnoremap <buffer><m-i> <Nop>

  nnoremap <buffer><m-n> <Nop>
  nnoremap <buffer><m-p> <Nop>

  " switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
  " <ESC> used to be here, it made alarm, and my leader key <space> is not working in insert mode.
  "for buffer_no in range(1, 9)
  "execute .nnoremap <buffer><Leader>. . buffer_no . . <Nop>.
  "endfor

  " switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
  "for buffer_no in range(10, 100)
  "execute .nnoremap <buffer><Leader>0. . buffer_no . . <Nop>.
  "endfor

    nnoremap <buffer><m-1> <Nop>
    nnoremap <buffer><m-2> <Nop>
    nnoremap <buffer><m-3> <Nop>
    nnoremap <buffer><m-4> <Nop>
    nnoremap <buffer><m-5> <Nop>
    nnoremap <buffer><m-6> <Nop>
    nnoremap <buffer><m-7> <Nop>
    nnoremap <buffer><m-8> <Nop>
    nnoremap <buffer><m-9> <Nop>
    nnoremap <buffer><m-0> <Nop>
    nnoremap <buffer><c-o> <Nop>
    nnoremap <buffer><c-i> <Nop>

endfunction

" Configure Plugins
" ==============================================================================
"
" ------------------
"" vim-airline
" ------------------


" Every time opening a ConqueTerm window, it will have a new name like 'bash - xx'
let bash_buf_names = []
for bash_no in range(1, 100)
    let bash_buf_names = bash_buf_names + ["bash - " . bash_no]
endfor

let g:airline#extensions#tabline#excludes = ['__Tagbar__', 'vimfiler:explorer'] + bash_buf_names

let g:airline_powerline_fonts = 0

" enable/disable enhanced tabline.
let g:airline#extensions#tabline#enabled = 1

" virtualenv
let g:airline#extensions#virtualenv#enabled = 1

let g:airline#extensions#tabline#show_tabs = 1

" enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#show_tab_nr = 1

" defines the name of a formatter for how buffer names are displayed.
let g:airline#extensions#tabline#formatter = 'default'

" enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#enabled = 1

" configure whether buffer numbers should be shown.
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure the formatting of filenames (see |filename-modifiers|).
let g:airline#extensions#tabline#fnamemod = ':p:.'
" configure collapsing parent directories in buffer name.
let g:airline#extensions#tabline#fnamecollapse = 1

" configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#tabline#buffer_min_count = 1


" configure separators for the tabline only.
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

nnoremap <m-n> :<c-u>bn<CR>
nnoremap <m-p> :<c-u>bp<CR>

" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
" <ESC> used to be here, it made alarm, and my leader key <space> is not working in insert mode.
"for buffer_no in range(1, 9)
"  execute 'map <leader>' . buffer_no . ' :<c-u>b' . buffer_no . '<CR>'
"endfor

" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
"for buffer_no in range(10, 100)
"  execute 'nnoremap <leader>0' . buffer_no . ' :<c-u>b' . buffer_no . '<CR>'
"endfor

" Use alt key to switch between buffers, can't switch to buffer numbers large than 10 by now
nnoremap <m-1> :b1<CR>
nnoremap <m-2> :b2<CR>
nnoremap <m-3> :b3<CR>
nnoremap <m-4> :b4<CR>
nnoremap <m-5> :b5<CR>
nnoremap <m-6> :b6<CR>
nnoremap <m-7> :b7<CR>
nnoremap <m-8> :b8<CR>
nnoremap <m-9> :b9<CR>
nnoremap <m-0> :b10<CR>

" Refresh airline color while reloading vimrc
if exists(":AirlineRefresh")
    AirlineRefresh
endif


" ------------------
"  vim-bbye
" ------------------
" Close current buffer, but preserve the window.
nnoremap <m-x> :Bdelete<CR>

" ------------------
"  BufOnly
" ------------------
" Close all buffers but the current one.
nnoremap <m-i> :BufOnly<CR>

" ------------------
"" Nerdtree
" ------------------
"
autocmd MyAutoCmd FileType nerdtree setlocal number
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.svn', '\.hg', '\.o$','\.bak$','\.pyc$']
"map <F6> :NERDTreeMirror<CR>
nnoremap <m-e> :NERDTreeToggle<CR>

" ------------------
"  Tagbar
" ------------------
"
nnoremap <m-a> :TagbarToggle<CR>
let g:tagbar_width=30

autocmd MyAutoCmd FileType tagbar call s:tagbar_my_settings()
function! s:tagbar_my_settings() "{{{
  call Disable_window_shortcut()
endfunction
"}}}

"------------------
"  Markdown
" ------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1


" ------------------
"  YouCompleteMe
"  -----------------
" YCM's identifier completer will also collect identifiers from tags files.
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'unite' : 1
      \}

" ------------------
" NERDCommenter
" ------------------

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

" ------------------
" Conque Shell
" ------------------
"
" Keep updating conque buffer after switching to other buffer
let g:ConqueTerm_ReadUnfocused = 1
" Close conque buffer when program exits
let g:ConqueTerm_CloseOnEnd = 1
nnoremap <m-t> <ESC>:ConqueTermSplit bash<CR>


" ------------------
"  MiniBufExplorer
" ------------------
"
"let g:miniBufExplBRSplit = 0   " Put new window above current or on the left for vertical split
"let g:miniBufExplSplitToEdge = 1 "Put minibufexplorer at the edge of window
"let g:miniBufExplBuffersNeeded = 1 " Autostart minibuf even there is only one buffer
"let g:miniBufExplStatusLineText = 'MINIBUFEXPLORER' " No statusline
"let g:did_minibufexplorer_syntax_inits = 1
"
"" Define color
""hi MBENormal guibg=black ctermbg=black
""hi MBEChanged guibg=red ctermbg=red
""hi MBEVisibleNormal guibg=darkgreen ctermbg=darkgreen
"hi MBEVisibleChanged guibg=red ctermbg=red
"hi MBEVisibleActiveChanged guibg=red ctermbg=red
"hi MBEVisibleActiveNormal guibg=darkgreen ctermbg=darkgreen
"" Tab is already used, this don't work.
""noremap <C-TAB>   :MBEbn<CR>
""noremap <C-S-TAB> :MBEbp<CR>
"noremap <c-n> <ESC>:MBEbn<CR>
"noremap <c-p> <ESC>:MBEbp<CR>
"noremap <c-w> <ESC>:MBEbd<CR>
"
""" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
"for buffer_no in range(1, 9)
"  execute 'noremap <Leader>' . buffer_no . ' <ESC>:b' . buffer_no . '\<CR>'
"endfor
"
"" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
"for buffer_no in range(10, 100)
"  execute 'noremap <Leader>0' . buffer_no . ' <ESC>:b' . buffer_no . '\<CR>'
"endfor

" ------------------
" vim-go
" ------------------
let g:go_disable_autoinstall = 1


" ------------------
" syntastic
" ------------------
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_column = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprevious<CR>


" ------------------
"  virtualenv
" ------------------

"TODO now is checking openstack's code, use this at present.
let g:virtualenv_directory = '.tox/'
