" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" set python binary for neovim
" this avoid use virtualenv python
" i don't want to install neovim-python to every virtualenv of mine.
if filereadable('/usr/bin/python')
  let g:python_host_prog = '/usr/bin/python'
elseif filereadable('/usr/local/bin/python')
  let g:python_host_prog = '/usr/local/bin/python'
endif

if filereadable('/usr/bin/python3')
  let g:python3_host_prog = '/usr/bin/python3'
elseif filereadable('/usr/local/bin/python3')
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Function to source vim configuration files.
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.lotusvim/rcs/' . a:path))
endfunction

" Configurations
" ==============================================================================
"
" Initialization:
call s:source_rc('init.rc.vim')
" Vundle Plugin:
call s:source_rc('dein.rc.vim')
" Utils:
call s:source_rc('utils.rc.vim')
" Encoding:
call s:source_rc('encoding.rc.vim')
" Keymappings:
call s:source_rc('mappings.rc.vim')
" Windows:
call s:source_rc('windows.rc.vim')
" FileType:
call s:source_rc('filetype.rc.vim')
" Customconfigs:
call s:source_rc('my_configs.rc.vim')

" Others
" ==============================================================================
set secure
