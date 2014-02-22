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

NeoBundle 'vim-scripts/cscope.vim.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'portante/pycscope.git', { 'build': {'unix': 'sudo python setup.py install',} }
NeoBundle 'dart-lang/dart-vim-plugin.git'

" Load local plugins, nice for doing development
execute 'NeoBundleLocal' '~/.lotus_vim/custom'

filetype plugin indent on
syntax enable

NeoBundleCheck

source ~/.lotus_vim/vimrcs/plugins/airline.vim
source ~/.lotus_vim/vimrcs/plugins/nerdtree.vim
source ~/.lotus_vim/vimrcs/plugins/tagbar.vim
source ~/.lotus_vim/vimrcs/plugins/vimshell.vim
source ~/.lotus_vim/vimrcs/plugins/markdown.vim
