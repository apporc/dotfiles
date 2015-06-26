"---------------------------------------------------------------------------
" Initialize:
"
"
" Default home directory.
let t:cwd = getcwd()

" Because a value is not set in $MYGVIMRC with the console, set it.
if !exists($MYGVIMRC)
  let $MYGVIMRC = expand('~/.vim/gvimrc')
endif

if !isdirectory(expand('~/.cache'))
  call mkdir(expand('~/.cache'), 'p')
endif

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

if filereadable(expand('~/.secret_vimrc'))
  execute 'source' expand('~/.secret_vimrc')
endif

let g:neobundle_dir = expand('~/.cache/neobundle')

if has('vim_starting') "{{{
  " Load neobundle.
  if isdirectory('neobundle.vim')
    set runtimepath^=neobundle.vim
  elseif finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath^=' . finddir('neobundle.vim', '.;')
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(g:neobundle_dir.'/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ g:neobundle_dir.'/neobundle.vim'
    endif

    execute 'set runtimepath^=' . g:neobundle_dir.'/neobundle.vim'
  endif
endif
"}}}

let g:neobundle#install_process_timeout=300
