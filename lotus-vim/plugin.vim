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

" Buffer Explorer
"NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'bling/vim-airline'

" Syntax Checker
NeoBundle 'kevinw/pyflakes.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'apporc/flake8.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'scrooloose/syntastic.git'

" Shell inside vim
" NeoBundle 'apporc/Conque-Shell.git'
NeoBundle 'Shougo/vimshell'

" cscope and pycscope, for code jumping
NeoBundle 'vim-scripts/cscope.vim.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'portante/pycscope.git', { 'build': {'unix': 'sudo python setup.py install',} }

" File types
NeoBundle 'dart-lang/dart-vim-plugin.git'

" Code completion
" NeoBundle'Shougo/neocomplcache'
" NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Valloric/YouCompleteMe'

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
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endi
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


