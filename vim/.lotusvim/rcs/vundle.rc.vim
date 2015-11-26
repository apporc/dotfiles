"===============================================================================
" Vundle
"===============================================================================
"
" vundle dir
let g:vundle_dir = expand('~/.cache/vundle')

if has('vim_starting') "{{{
    if !isdirectory(g:vundle_dir.'/Vundle.vim')
      execute printf('!git clone %s://github.com/VundleVim/Vundle.vim',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ g:vundle_dir.'/Vundle.vim'
    endif

    execute 'set runtimepath^=' . g:vundle_dir.'/Vundle.vim'
endif
"}}}


call vundle#begin(g:vundle_dir)

" Color Scheme
Plugin 'apporc/grb256'

" Tagbar
Plugin 'majutsushi/tagbar'

" File Browsing
Plugin 'scrooloose/nerdtree.git'

" Buffer Explorer
Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'  " Preserve the window when closing buffer.
Plugin 'vim-scripts/BufOnly.vim'

" Syntax Checker
Plugin 'scrooloose/syntastic.git'

" Shell inside vim
Plugin 'apporc/Conque-Shell.git'

" cscope and pycscope, for code jumping
Plugin 'vim-scripts/cscope.vim.git'
Plugin 'portante/pycscope.git'

" File types
Plugin 'fatih/vim-go.git'
Plugin 'dart-lang/dart-vim-plugin.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'vim-scripts/po.vim.git'
Plugin 'klen/python-mode'
Plugin 'moll/vim-node'

" For markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Code completion, a bug of YouComleteMe to eat memory
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

" Git
Plugin 'tpope/vim-fugitive'

" Match Tags for HTML/XML...
Plugin 'valloric/MatchTagAlways'

Plugin 'jmcantrell/vim-virtualenv'

" drawit
Plugin 'vim-scripts/DrawIt.git'

call vundle#end()
