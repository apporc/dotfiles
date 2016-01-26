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

" Vundle itself
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
Plugin 'flazz/vim-colorschemes'

" Tagbar
Plugin 'majutsushi/tagbar'

" File Browsing
Plugin 'scrooloose/nerdtree.git'

" Buffer Explorer
Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'  " Preserve the window when closing buffer.
Plugin 'vim-scripts/BufOnly.vim'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'Shougo/neoinclude.vim'

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

" python autocomplete and definition
Plugin 'klen/python-mode'

" javascript autocomplete and definition
Plugin 'ternjs/tern_for_vim'

" For markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'Valloric/YouCompleteMe'

" Git
Plugin 'tpope/vim-fugitive'

" Match Tags for HTML/XML...
Plugin 'valloric/MatchTagAlways'

Plugin 'jmcantrell/vim-virtualenv'

" drawit
Plugin 'vim-scripts/DrawIt.git'
" graphviz
Plugin 'wannesm/wmgraphviz.vim'

call vundle#end()
