"===============================================================================
" NeoBundle
"===============================================================================

if has ('vim_starting')
  set runtimepath+=~/.lotus_vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.lotus_vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Tagbar
NeoBundle 'majutsushi/tagbar'

" File Browsing
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Shougo/vimfiler' "TODO see it

" Fuzzy Search
NeoBundle 'Shougo/unite.vim' "TODO see it deeply
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'

" Buffer Explorer
"NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'bling/vim-airline' "TODO tabline appearance

" Syntax Checker
NeoBundle 'kevinw/pyflakes.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'apporc/flake8.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'scrooloose/syntastic.git'

" Shell inside vim
" NeoBundle 'apporc/Conque-Shell.git'
NeoBundle 'Shougo/vimshell'
" NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-dispatch' "TODO see it

" cscope and pycscope, for code jumping
NeoBundle 'vim-scripts/cscope.vim.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'portante/pycscope.git', { 'build': {'unix': 'sudo python setup.py install',} }

" File types
NeoBundle 'dart-lang/dart-vim-plugin.git'
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'tpope/vim-markdown' "Markdown
NeoBundle 'terryma/vim-instant-markdown' "Markdown
" NeoBundle 'vim-ruby/vim-ruby' "Ruby
" NeoBundle 'tpope/vim-rails'
NeoBundle 'psykidellic/vim-jekyll' "Jekyll
" NeoBundle 'kchmck/vim-coffee-script' "CoffeeScript
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tsaleh/vim-matchit'

" Code completion
" NeoBundle'Shougo/neocomplcache'
" NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Valloric/YouCompleteMe'
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'vim-scripts/AutoComplPop'

" Snippets
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips' "TODO see it deeply
" NeoBundle 'JazzCore/neocomplcache-ultisnips'

" Comments
NeoBundle 'scrooloose/nerdcommenter' "TODO see it

" Motions
NeoBundle 'Lokaltog/vim-easymotion' "TODO see it deeply
NeoBundle 'goldfeld/vim-seek' "TODO see it deeply

" Text Objects TODO see it deeply
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_
" NeoBundle 'terryma/vim-expand-region'

" Color themems
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'Lokaltog/vim-distinguished'
" NeoBundle 'chriskempson/base16-vim'
" NeoBundle 'tpope/vim-vividchalk'
" NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
" NeoBundle 'rainux/vim-desert-warm-256'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'vim-scripts/wombat256.vim'

" Misc
" NeoBundle 'kana/vim-submode'
" NeoBundle 'kana/vim-scratch'
" NeoBundle 'vim-scripts/BufOnly.vim'
" NeoBundle 'sjl/gundo.vim'
" NeoBundle 't9md/vim-quickhl'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'mattn/gist-vim'
" NeoBundle 'koron/nyancat-vim'
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'ton/vim-bufsurf'
" " NeoBundle 'terryma/vim-smooth-scroll'
"
" Git TODO see it
NeoBundle 'tpope/vim-fugitive'

" Load local plugins, nice for doing development
execute 'NeoBundleLocal' '~/.lotus_vim/custom'

filetype plugin indent on

NeoBundleCheck

" ==============================================================================
" Configure Plugins
" ==============================================================================
"

" ------------------
"" vim-airline
" ------------------
" Use powerline fonts TODO get back font patcher in install.sh
let g:airline_powerline_fonts = 1

" enable/disable enhanced tabline.
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
let g:airline#extensions#tabline#buffer_min_count = 0


" configure separators for the tabline only.
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" mappings for tabline
nnoremap <leader>f <ESC>:bn<CR>
nnoremap <leader>b <ESC>:bp<CR>

"" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
for buffer_no in range(1, 9)
  execute "nmap <Leader>" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor

" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
for buffer_no in range(10, 100)
  execute "nmap <Leader>0" . buffer_no . " <ESC>:b" . buffer_no . "\<CR>"
endfor

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
noremap <leader>e :NERDTreeToggle<CR>

" ------------------
"  Tagbar
" ------------------
"
nmap <leader>a :TagbarToggle<CR>
let g:tagbar_width=30

" ------------------
" VimShell
" ------------------
"
"Open a shell splitwindow
map <leader>t :VimShellPop<CR>
" Make shell window show below the current window.
set splitbelow

" ------------------
"  Markdown
" ------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1


" -----------------
"  YouCompleteMe
"  ----------------
" YCM's identifier completer will also collect identifiers from tags files.
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'unite' : 1
      \}

" -----------------
"  Unite
" -----------------
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

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
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
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
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

" Quick commands
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

"===============================================================================
" Unite Sessions
"===============================================================================

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

"===============================================================================
" Vimfiler
"===============================================================================

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
