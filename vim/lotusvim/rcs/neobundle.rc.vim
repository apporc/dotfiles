"===============================================================================
" NeoBundle
"===============================================================================

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

" Fuzzy Search
NeoBundle 'Shougo/unite.vim' "TODO see it deeply
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'

" Buffer Explorer
"NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'bling/vim-airline' "TODO tabline appearance

" Most Recently Used Files
NeoBundle 'Shougo/neomru.vim'

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
NeoBundle 'tpope/vim-markdown' "Markdown
NeoBundle 'terryma/vim-instant-markdown' "Markdown

" Code completion
NeoBundle 'Valloric/YouCompleteMe'

filetype plugin indent on

" Enable syntax color.
syntax enable

" Installation check.
NeoBundleCheck

