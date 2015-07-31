"===============================================================================
" NeoBundle
"===============================================================================
"

call neobundle#begin(g:neobundle_dir)

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    }
    \ }

" Color Scheme
NeoBundle 'apporc/grb256'

" Tagbar
NeoBundle 'majutsushi/tagbar'

" File Browsing
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Shougo/vimfiler.vim'

" Fuzzy Search
NeoBundle 'Shougo/unite.vim' "TODO see it deeply
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'

" Buffer Explorer
"NeoBundle 'fholgado/minibufexpl.vim.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'moll/vim-bbye'  " Preserve the window when closing buffer.
NeoBundle 'vim-scripts/BufOnly.vim'

" Most Recently Used Files
NeoBundle 'Shougo/neomru.vim'

" Syntax Checker
NeoBundle 'scrooloose/syntastic.git'

" Shell inside vim
NeoBundle 'apporc/Conque-Shell.git'
"NeoBundle 'Shougo/vimshell'

" cscope and pycscope, for code jumping
NeoBundle 'vim-scripts/cscope.vim.git'
NeoBundle 'portante/pycscope.git'

" File types
NeoBundle 'fatih/vim-go.git'
NeoBundle 'dart-lang/dart-vim-plugin.git'
NeoBundle 'rodjek/vim-puppet.git'
NeoBundle 'vim-scripts/po.vim.git'

" For markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'isnowfy/python-vim-instant-markdown.git'
"NeoBundle 'suan/vim-instant-markdown'

" Code completion
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/echodoc.vim'

" Git
NeoBundle 'tpope/vim-fugitive'

" Code Review
NeoBundle 'junkblocker/patchreview-vim.git'
NeoBundle 'codegram/vim-codereview.git'

" Match Tags for HTML/XML...
NeoBundle 'valloric/MatchTagAlways'

" snippets, autocomplete () {} ...
NeoBundleLazy 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" wordpress
NeoBundle 'apporc/VimRepress.git'

" virtualenv
NeoBundle 'jmcantrell/vim-virtualenv'

" drawit
NeoBundle 'vim-scripts/DrawIt.git'

" Installation check.
NeoBundleCheck
NeoBundleSaveCache

call neobundle#config(['echodoc.vim', 'neocomplete.vim'], {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})

call neobundle#config('neosnippet.vim', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/neosnippet-snippets',
      \ 'autoload' : {
      \   'insert' : 1,
      \   'filetypes' : 'snippet',
      \   'unite_sources' : [
      \      'neosnippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }})

call neobundle#config('unite.vim',{
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'Unite',
      \                   'complete' : 'customlist,unite#complete_source'},
      \                 'UniteWithCursorWord', 'UniteWithInput']
      \ }})

call neobundle#config('vimfiler.vim', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \    'commands' : [
      \                  { 'name' : 'VimFiler',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'VimFilerTab',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'VimFilerExplorer',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Edit',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Write',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  'Read', 'Source'],
      \    'mappings' : '<Plug>(vimfiler_',
      \    'explorer' : 1,
      \ }
      \ })

call neobundle#config('vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \     'linux' : 'make',
      \    },
      \ })
" call neobundle#config('vimshell', {
"       \ 'lazy' : 1,
"       \ 'autoload' : {
"       \   'commands' : [{ 'name' : 'VimShell',
"       \                   'complete' : 'customlist,vimshell#complete'},
"       \                 'VimShellExecute', 'VimShellInteractive',
"       \                 'VimShellCreate',
"       \                 'VimShellTerminal', 'VimShellPop'],
"       \   'mappings' : '<Plug>(vimshell_'
"       \ }})

call neobundle#config('pycscope', {
      \ 'build': {
      \     'unix': 'sudo python setup.py install',
      \     },
      \ })

call neobundle#config('unite-outline', {
      \ 'lazy' : 1,
      \ })

call neobundle#end()
