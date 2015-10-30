"===============================================================================
" Vundle
"===============================================================================
"

call vundle#begin(g:vundle_dir)

" Color Scheme
Plugin 'apporc/grb256'

" Tagbar
Plugin 'majutsushi/tagbar'

" File Browsing
Plugin 'scrooloose/nerdtree.git'

" Buffer Explorer
"Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'  " Preserve the window when closing buffer.
Plugin 'vim-scripts/BufOnly.vim'

" Syntax Checker
Plugin 'scrooloose/syntastic.git'

" Shell inside vim
Plugin 'apporc/Conque-Shell.git'
"Plugin 'Shougo/vimshell'

" cscope and pycscope, for code jumping
Plugin 'vim-scripts/cscope.vim.git'
Plugin 'portante/pycscope.git'

" File types
Plugin 'fatih/vim-go.git'
Plugin 'dart-lang/dart-vim-plugin.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'vim-scripts/po.vim.git'

" For markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'isnowfy/python-vim-instant-markdown.git'
"Plugin 'suan/vim-instant-markdown'

" Code completion, a bug of YouComleteMe to eat memory
" Plugin 'Valloric/YouCompleteMe'

" Git
Plugin 'tpope/vim-fugitive'

" Code Review
Plugin 'junkblocker/patchreview-vim.git'
Plugin 'codegram/vim-codereview.git'

" Match Tags for HTML/XML...
Plugin 'valloric/MatchTagAlways'

" wordpress
Plugin 'apporc/VimRepress.git'

" virtualenv
Plugin 'jmcantrell/vim-virtualenv'

" drawit
Plugin 'vim-scripts/DrawIt.git'

call vundle#end()
