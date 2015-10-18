"---------------------------------------------------------------------------

" Initialize:
" ==============================================================================

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

" Vundle:
" ==============================================================================

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
