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
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
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

autocmd MyAutoCmd FileType tagbar call s:tagbar_my_settings()
function! s:tagbar_my_settings() "{{{
  call Disable_window_shortcut()
endfunction
"}}}

" ------------------
" Conque Shell
" ------------------
"
" Keep updating conque buffer after switching to other buffer
let g:ConqueTerm_ReadUnfocused = 1
" Close conque buffer when program exits
let g:ConqueTerm_CloseOnEnd = 1
nnoremap <m-t> <ESC>:ConqueTermSplit bash<CR>
