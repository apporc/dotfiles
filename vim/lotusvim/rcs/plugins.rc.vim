" Configure Plugins
" ==============================================================================
"
" ------------------
"" vim-airline
" ------------------
" Use powerline fonts TODO get back font patcher in install.sh
let g:airline_powerline_fonts = 0

" enable/disable enhanced tabline.
" Use minibufexplorer now
let g:airline#extensions#tabline#enabled = 1

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

noremap <c-n> <ESC>:bn<CR>
noremap <c-p> <ESC>:bp<CR>

" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
for buffer_no in range(1, 9)
  execute "noremap <Leader>" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor

" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
for buffer_no in range(10, 100)
  execute "noremap <Leader>0" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor

" Refresh airline color while reloading vimrc
if exists(":AirlineRefresh")
    AirlineRefresh
endif


" ------------------
"  vim-bbye
" ------------------
" Close current buffer, but preserve the window.
noremap <c-w> <ESC>:Bdelete<CR>

" ------------------
"  BufOnly
" ------------------
" Close all buffers but the current one.
noremap <c-s-w> <ESC>:BufOnly<CR>

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
nnoremap <c-e> :NERDTreeToggle<CR>

" ------------------
"  Tagbar
" ------------------
"
nnoremap <c-a> :TagbarToggle<CR>
let g:tagbar_width=30

" ------------------
" VimShell
" ------------------
"
"Open a shell splitwindow
"nnoremap <c-t> :VimShellPop <CR>
" Make shell window show below the current window.
set splitbelow

" Use default key mappings
let g:vimshell_no_default_keymappings = 0
let g:vimshell_no_save_history_commands = {}
let g:vimshell_interactive_no_save_history_commands = {}

let g:vimshell_prompt_expr =
    \ 'escape($USER . ":". fnamemodify(getcwd(), ":~")."%", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\)\+\:\%(\f\|\\.\)\+% '
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_split_command = ''
let g:vimshell_enable_transient_user_prompt = 1
let g:vimshell_force_overwrite_statusline = 1

autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
    " Display user name on Linux.
    " let g:vimshell_prompt = $USER."% "

    " custom mappings
    nnoremap <buffer> <c-k> <Nop>
    nnoremap <buffer> <c-k> <c-w>k
    " Use ctrl-L to clear in insert mode.
    imap <buffer> <c-l> <ESC><Plug>(vimshell_clear)i

    call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
    call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
    let g:vimshell_execute_file_list['zip'] = 'zipinfo'
    call vimshell#set_execute_file('tgz,gz', 'gzcat')
    call vimshell#set_execute_file('tbz,bz2', 'bzcat')

    " Use gnome-terminal.
    " let g:vimshell_use_terminal_command = 'gnome-terminal -e'

    " Initialize execute file list.
    let g:vimshell_execute_file_list = {}
    call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
    let g:vimshell_execute_file_list['rb'] = 'ruby'
    let g:vimshell_execute_file_list['pl'] = 'perl'
    let g:vimshell_execute_file_list['py'] = 'python'
    call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

    nnoremap <silent><buffer> <C-j>
        \ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>

    " Auto jump.
    call vimshell#set_alias('j', ':Unite -buffer-name=files
        \ -default-action=lcd -no-split -input=$$args directory_mru')

    call vimshell#set_alias('up', 'cdup')

    call vimshell#hook#add('chpwd', 'my_chpwd', s:vimshell_hooks.chpwd)
    call vimshell#hook#add('notfound', 'my_notfound', s:vimshell_hooks.notfound)
    call vimshell#hook#add('preprompt', 'my_preprompt', s:vimshell_hooks.preprompt)
    call vimshell#hook#add('preexec', 'my_preexec', s:vimshell_hooks.preexec)
endfunction

autocmd MyAutoCmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
  call vimshell#hook#set('input', [s:vimshell_hooks.input])
endfunction

autocmd MyAutoCmd FileType term-* call s:terminal_settings()
function! s:terminal_settings()
  inoremap <silent><buffer><expr> <Plug>(vimshell_term_send_semicolon)
        \ vimshell#term_mappings#send_key(';')
  inoremap <silent><buffer><expr> j<Space>
        \ vimshell#term_mappings#send_key('j')
  "inoremap <silent><buffer><expr> <Up>
  "      \ vimshell#term_mappings#send_keys("\<ESC>[A")

  " Sticky key.
  imap <buffer><expr> ;  <SID>texe_sticky_func()

  " Escape key.
  iunmap <buffer> <ESC><ESC>
  imap <buffer> <ESC>         <Plug>(vimshell_term_send_escape)
endfunction
function! s:texe_sticky_func()
  let sticky_table = {
        \',' : '<', '.' : '>', '/' : '?',
        \'1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
        \'6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')', '-' : '_', '=' : '+',
        \';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
        \}
  let special_table = {
        \ "\<ESC>" : "\<ESC>", "\<CR>" : ";\<CR>"
        \ "\<Space>" : "\<Plug>(vimshell_term_send_semicolon)",
        \}

  if mode() !~# '^c'
    echo 'Input sticky key: '
  endif
  let char = ''

  while char == ''
    let char = nr2char(getchar())
  endwhile

  if char =~ '\l'
    return toupper(char)
  elseif has_key(sticky_table, char)
    return sticky_table[char]
  elseif has_key(special_table, char)
    return special_table[char]
  else
    return ''
  endif
endfunction

let s:vimshell_hooks = {}
function! s:vimshell_hooks.chpwd(args, context)
  if len(split(glob('*'), '\n')) < 100
    call vimshell#execute('ls')
  else
    call vimshell#execute('echo "Many files."')
  endif
endfunction
function! s:vimshell_hooks.emptycmd(cmdline, context)
  call vimshell#set_prompt_command('ls')
  return 'ls'
endfunction
function! s:vimshell_hooks.notfound(cmdline, context)
  return ''
endfunction
function! s:vimshell_hooks.preprompt(args, context)
  " call vimshell#execute('echo "preprompt"')
endfunction
function! s:vimshell_hooks.preexec(cmdline, context)
  " call vimshell#execute('echo "preexec"')

  let args = vimproc#parser#split_args(a:cmdline)
  if len(args) > 0 && args[0] ==# 'diff'
    call vimshell#set_syntax('diff')
  endif

  return a:cmdline
endfunction
function! s:vimshell_hooks.input(input, context)
  " echomsg 'input'
  return a:input
endfunction

" ------------------
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
" Neocomplete
" ------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 0
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
"
"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"autocmd FileType c  setlocal omnifunc=ccomplete#Complete
"autocmd FileType cpp  setlocal omnifunc=ccomplete#Complete
"autocmd FileType sh  setlocal omnifunc=ccomplete#Complete
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" ------------------
"  Unite
" ------------------

let g:unite_prompt = 'Unite %'
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

" Map , to the prefix for Unite
nnoremap , <Nop>
nnoremap [unite] <Nop>
nmap , [unite]

" General fuzzy search
nnoremap <silent> [unite]s :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
"nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd with the word under cursor
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
      " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick history commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

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
  imap <buffer> jj <Plug>(unite_insert_leave)
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
" Vimfiler
" ------------------

" Example at: https://github.com/hrsh7th/dotfiles/blob/master/vim/.vimrc
nnoremap <expr><F2> g:my_open_explorer_command()
function! g:my_open_explorer_command()
  return printf(":\<C-u>VimFilerBufferDir -buffer-name=%s -split -auto-cd -toggle -no-quit -winwidth=%s\<CR>",
        \ g:my_vimfiler_explorer_name,
        \ g:my_vimfiler_winwidth)
endfunction

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '✓'
" let g:vimfiler_readonly_file_icon = ' '
let g:my_vimfiler_explorer_name = 'explorer'
let g:my_vimfiler_winwidth = 30
let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_directory_display_top = 1

autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
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
" Use vimshell now
noremap <c-t> <ESC>:ConqueTermSplit bash<CR>


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
"  execute "noremap <Leader>" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
"endfor
"
"" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
"for buffer_no in range(10, 100)
"  execute "noremap <Leader>0" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
"endfor
"
