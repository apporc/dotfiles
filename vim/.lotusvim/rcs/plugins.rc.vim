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


let g:airline#extensions#tabline#excludes = ['__Tagbar__', 'vimfiler:explorer']

" Use powerline fonts TODO get back font patcher in install.sh
let g:airline_powerline_fonts = 0

" enable/disable enhanced tabline.
let g:airline#extensions#tabline#enabled = 1

" virtualenv
let g:airline#extensions#virtualenv#enabled = 1

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
"autocmd MyAutoCmd BufEnter *
"      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.svn', '\.hg', '\.o$','\.bak$','\.pyc$']
"map <F6> :NERDTreeMirror<CR>
"<c-e> is vimfiler now.
"nnoremap <c-e> :NERDTreeToggle<CR>

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
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_filetype_blacklist = {
"      \ 'notes' : 1,
"      \ 'markdown' : 1,
"      \ 'text' : 1,
"      \ 'unite' : 1
"      \}

" ------------------
"  Unite
" ------------------

let g:unite_prompt = 'Unite %'
let g:unite_source_grep_default_opts = '-iHn --exclude=.* --exclude-dir=.[^.]*'
let g:unite_source_grep_recursive_opt = '-r'

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])


" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ ], '\|'))

" General fuzzy search
nnoremap <silent> <leader>s :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> <leader>r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> <leader>u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> <leader>p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> <leader>a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
"nnoremap <silent> <leader>s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> <leader>d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> <leader>f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd with the word under cursor
nnoremap <silent> <leader>g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> <leader>h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> <leader>l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> <leader>n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> <leader>b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> <leader>b :<C-u>UniteWithBufferDir
      " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick history commands
nnoremap <silent> <leader>; :<C-u>Unite -buffer-name=history history/command command<CR>

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_exit_insert)
  imap <buffer> kk <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  " Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif

" ------------------
" Unite Sessions
" ------------------

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Pop up session selection if no file is specified
" TODO: Why does this not work when Vim isn't run from tmux???!
autocmd MyAutoCmd VimEnter * call s:unite_session_on_enter()
function! s:unite_session_on_enter()
  if !argc() && !exists("g:start_session_from_cmdline")
    Unite -buffer-name=sessions session
  endif
endfunction

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
"Neocomplete
" ------------------
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_cursor_hold_i = 1
let g:neocomplete#enable_insert_char_pre = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" ------------------
" VimShell
" ------------------
"
"Open a shell splitwindow
" nnoremap <m-t> :VimShellPop <CR>
" " Make shell window show below the current window.
" set splitbelow
"
" " Use default key mappings
" let g:vimshell_no_default_keymappings = 0
" let g:vimshell_no_save_history_commands = {}
" let g:vimshell_interactive_no_save_history_commands = {}
"
" let g:vimshell_prompt_expr =
"     \ 'escape($USER . ":". fnamemodify(getcwd(), ":~")."%", "\\[]()?! ")." "'
" let g:vimshell_prompt_pattern = '^\%(\f\)\+\:\%(\f\|\\.\)\+% '
" " let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_split_command = ''
" let g:vimshell_enable_transient_user_prompt = 1
" let g:vimshell_force_overwrite_statusline = 1
"
" autocmd MyAutoCmd FileType vimshell call s:vimshell_my_settings()
" function! s:vimshell_my_settings() "{{{
"   imap <buffer><C-l> <Plug>(vimshell_clear)
"   "The only way to exit vimshell is to type exit
"   "nmap <buffer><C-w> <Plug>(vimshell_exit)
"   nnoremap <buffer><m-k> <c-w>k
"   nnoremap <buffer><m-l> <c-w>l
"   call Disable_window_shortcut()
" endfunction
" "}}}

" ------------------
" echodoc
" ------------------
let bundle = neobundle#get('echodoc.vim')
function! bundle.hooks.on_source(bundle)
  let g:echodoc_enable_at_startup = 1
endfunction
unlet bundle

" ------------------
" vimfiler
" ------------------
let g:vimfiler_enable_clipboard = 0
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_as_default_explorer = 1

nnoremap <m-e> :VimFilerExplorer<CR>
" %p : full path
" %d : current directory
" %f : filename
" %F : filename removed extensions
" %* : filenames
" %# : filenames fullpath
let g:vimfiler_sendto = {
      \ 'unzip' : 'unzip %f',
      \ 'zip' : 'zip -r %F.zip %*',
      \ 'Inkscape' : 'inkspace',
      \ 'GIMP' : 'gimp %*',
      \ 'gedit' : 'gedit',
      \ }

autocmd MyAutoCmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings() "{{{
  call vimfiler#set_execute_file('vim', 'vim')
  call vimfiler#set_execute_file('txt', 'vim')
  nmap <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
  nmap <buffer><c-r> <Plug>(vimfiler_redraw_screen)
  nmap <buffer><m-l> <Plug>(vimfiler_switch_to_other_window)
  nmap <buffer><m-j> <Plug>(vimfiler_switch_to_other_window)
  "nmap <buffer><c-w> <Plug>(vimfiler_exit)

  call Disable_window_shortcut()

endfunction
"}}}

" ------------------
" neosnippet.vim
" ------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)


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
