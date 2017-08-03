" Shougo/dein.vim
"===============================================================================
"
let g:dein_dir = expand('~/.cache/dein')
execute 'set runtimepath+='. g:dein_dir . '/repos/github.com/Shougo/dein.vim'

" need to set timeout for YouCompleteMe
let g:dein#install_process_timeout = 1800

if dein#load_state(g:dein_dir)
    call dein#begin(g:dein_dir)

    call dein#add(g:dein_dir . '/repos/github.com/Shougo/dein.vim')

    " Color Scheme
    call dein#add('apporc/vim-colorschemes')
    " Tagbar
    call dein#add('majutsushi/tagbar')
    " File Browsing
    call dein#add('scrooloose/nerdtree.git')
    " Buffer Explorer
    call dein#add('bling/vim-airline')
    call dein#add('moll/vim-bbye')  " Preserve the window when closing buffer.
    call dein#add('vim-scripts/BufOnly.vim')

    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neomru.vim')

    " Syntax Checker
    call dein#add('neomake/neomake')

    " File types
    call dein#add('dart-lang/dart-vim-plugin.git')
    call dein#add('rodjek/vim-puppet.git')
    call dein#add('vim-scripts/po.vim.git')
    call dein#add('ternjs/tern_for_vim', {'merged': 0, 'build': 'npm install'})

    " autocomplete and definition
    " currently need to instll yaourt -S ncurses5-compat-libs to make it work
    " on archlinu.
    call dein#add('Valloric/YouCompleteMe', {'merged': 0, 'build': './install.py --clang-completer --gocode-completer --tern-completer'})

    " for python
    call dein#add('Vimjas/vim-python-pep8-indent')
    call dein#add('tell-k/vim-autopep8')
    call dein#add('jmcantrell/vim-virtualenv')

    " For markdown
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')

    " integrate ultisnips with vim-snippets.
    call dein#add('honza/vim-snippets')

    " auto close brackets
    call dein#add('Raimondi/delimitMate')

    " Git
    call dein#add('tpope/vim-fugitive')

    " Match Tags for HTML/XML...
    call dein#add('Valloric/MatchTagAlways')

    " drawit
    call dein#add('vim-scripts/DrawIt.git')
    " graphviz
    call dein#add('wannesm/wmgraphviz.vim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

"update plugins
"if dein#check_update()
"    call dein#update()
"endif
" remove unused plugins
"if dein#check_clean()
"    call map(dein#check_clean(), \"delete(v:val, 'rf')\")
"endif
