" Show filename as window title
set title

" split to below adn right
set splitbelow
set splitright

" The most comfortable colorscheme in fact is default.
colorscheme grb256

set background=dark

" 256bit terminal
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Command Line, Tab Line and Status Line Settings
" ------------------------------------------------------------------------------
"
" Show (partial) command in the last line of the screen
set showcmd
" Always show the status line
set laststatus=2
" Height of command line.
set cmdheight=2


" ------------------
"" vim-airline
" ------------------


" Every time opening a ConqueTerm window, it will have a new name like 'zsh - xx'
let zsh_buf_names = []
for zsh_no in range(1, 100)
    let zsh_buf_names = zsh_buf_names + ["zsh - " . zsh_no]
endfor

let g:airline#extensions#tabline#excludes = ['__Tagbar__', 'vimfiler:explorer'] + zsh_buf_names

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


function! SwitchToNextBuffer(incr, split)
    let current = bufnr("%")
    let last = bufnr("$")
    let new = current + a:incr
    while 1
        if new < 1
            let new = last
        elseif new > last
            let new = 1
        endif
        if new != 0 && bufexists(new) && buflisted(new) && (getbufvar(new, "&filetype") != 'help')
            if new == current
                break
            else
                if a:split == "vsplit"
                    execute ":vsplit"
                elseif a:split == "split"
                    execute ":split"
                endif
                execute ":buffer ".new
                break
            endif
        endif
        let new = new + a:incr
    endwhile
endfunction

function! SwitchToBuffer(number, split)
    let current = bufnr("%")
    let new = a:number
    if new != 0 && bufexists(new) && buflisted(new) && (getbufvar(new, "&filetype") != 'help')
        if new != current
            if a:split == "vsplit"
                execute ":vsplit"
            elseif a:split == "split"
                execute ":split"
            endif
            execute ":buffer ".new
        endif
    endif
endfunction

nnoremap  <m-n> :call SwitchToNextBuffer(1, "nosplit")<CR>
nnoremap  <m-s-n> :call SwitchToNextBuffer(1, "vsplit")<CR>
nnoremap  <m-p> :call SwitchToNextBuffer(-1, "nosplit")<CR>
nnoremap  <m-s-p> :call SwitchToNextBuffer(-1, "vsplit")<CR>
inoremap  <m-n> <ESC>:call SwitchToNextBuffer(1, "nosplit")<CR>
inoremap  <m-s-n> <ESC>:call SwitchToNextBuffer(1, "vsplit")<CR>
inoremap  <m-p> <ESC>:call SwitchToNextBuffer(-1, "nosplit")<CR>
inoremap  <m-s-p> <ESC>:call SwitchToNextBuffer(-1, "vsplit")<CR>
if has('nvim')
  tnoremap  <m-n> <C-\><C-n>:call SwitchToNextBuffer(1, "nosplit")<CR>
  tnoremap  <m-s-n> <C-\><C-n>:call SwitchToNextBuffer(1, "vsplit")<CR>
  tnoremap  <m-p> <C-\><C-n>:call SwitchToNextBuffer(-1, "nosplit")<CR>
  tnoremap  <m-s-p> <C-\><C-n>:call SwitchToNextBuffer(-1, "vsplit")<CR>
endif

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
nnoremap <m-1> :call SwitchToBuffer(1, "nosplit")<CR>
nnoremap <m-2> :call SwitchToBuffer(2, "nosplit")<CR>
nnoremap <m-3> :call SwitchToBuffer(3, "nosplit")<CR>
nnoremap <m-4> :call SwitchToBuffer(4, "nosplit")<CR>
nnoremap <m-5> :call SwitchToBuffer(5, "nosplit")<CR>
nnoremap <m-6> :call SwitchToBuffer(6, "nosplit")<CR>
nnoremap <m-7> :call SwitchToBuffer(7, "nosplit")<CR>
nnoremap <m-8> :call SwitchToBuffer(8, "nosplit")<CR>
nnoremap <m-9> :call SwitchToBuffer(9, "nosplit")<CR>

nnoremap <m-!> :call SwitchToBuffer(1, "vsplit")<CR>
nnoremap <m-@> :call SwitchToBuffer(2, "vsplit")<CR>
nnoremap <m-#> :call SwitchToBuffer(3, "vsplit")<CR>
nnoremap <m-$> :call SwitchToBuffer(4, "vsplit")<CR>
nnoremap <m-%> :call SwitchToBuffer(5, "vsplit")<CR>
nnoremap <m-^> :call SwitchToBuffer(6, "vsplit")<CR>
nnoremap <m-&> :call SwitchToBuffer(7, "vsplit")<CR>
nnoremap <m-*> :call SwitchToBuffer(8, "vsplit")<CR>
nnoremap <m-(> :call SwitchToBuffer(9, "vsplit")<CR>


" ------------------
"  vim-bbye
" ------------------
" Close current buffer, but preserve the window.
nnoremap <m-x> :Bdelete!<CR>

" ------------------
"  BufOnly
" ------------------
" Close all buffers but the current one.
nnoremap <m-i> :BufOnly<CR>

" ------------------
"" Nerdtree
" ------------------
"
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.svn', '\.hg', '\.o$','\.bak$','\.pyc$']

function! s:nerdtree_my_settings()
  setlocal number
  call Disable_window_shortcut()
endfunction
autocmd MyAutoCmd FileType nerdtree call s:nerdtree_my_settings()

" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <m-e> :NERDTreeToggle<CR>

" ------------------
"  Tagbar
" ------------------
"
nnoremap <m-a> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_sort = 0

autocmd MyAutoCmd FileType tagbar call s:tagbar_my_settings()
function! s:tagbar_my_settings() "{{{
  call Disable_window_shortcut()
endfunction
"}}}

" ------------------
" Terminal && Conque Shell
" ------------------
"
" Keep updating conque buffer after switching to other buffer
let g:ConqueTerm_ReadUnfocused = 1
" Close conque buffer when program exits
let g:ConqueTerm_CloseOnEnd = 1
" suppress warning message
let g:ConqueTerm_StartMessages = 0
if has('nvim')
    " use neovim's own terminal
    nnoremap <m-t> :vsplit term://zsh<CR>
    nnoremap <m-s-t> :split term://zsh<CR>
    " automatically go to insert mode
    autocmd BufWinEnter,WinEnter term://* startinsert
    " automatically go to normal mode
    autocmd BufLeave term://* stopinsert
else
    nnoremap <m-t> :ConqueTermVSplit zsh<CR>
    nnoremap <m-s-t> :ConqueTermSplit zsh<CR>
endif

autocmd MyAutoCmd FileType conque_term call s:conque_term_my_settings()
function! s:conque_term_my_settings() "{{{
    call Disable_window_shortcut()
endfunction
"}}}
"

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
      \ '.tox/',
      \ 'build/',
      \ 'dist/',
      \ '.eggs/',
      \ ], '\|'))
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'max_candidates', 1000)

" General fuzzy search
nnoremap <silent> <leader>s :<C-u>Unite
      \ -buffer-name=files buffer file_mru file_rec/async<CR>

" Quick registers
nnoremap <silent> <leader>r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> <leader>u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick file search
nnoremap <silent> <leader>f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd with the word under cursor
nnoremap <silent> <leader>g :<C-u>UniteWithCursorWord -buffer-name=grep grep:.<CR>

" Quick line using the word under cursor
nnoremap <silent> <leader>l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick find
nnoremap <silent> <leader>n :<C-u>Unite -buffer-name=find find:.<CR>

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
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> gg <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-l> <Plug>(unite_redraw)
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

let g:unite_source_grep_default_opts = '-iHn --exclude=.* --exclude-dir=.[^.]* --exclude=*.pyc'
let g:unite_source_grep_recursive_opt = '-r'
