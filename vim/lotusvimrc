" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Functions
" ==============================================================================
"
" Function to source vim configuration files.
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.lotusvim/rcs/' . a:path))
endfunction

"Other functions
call s:source_rc('func.rc.vim')

" Configurations
" ==============================================================================
"
" Initialization:
call s:source_rc('init.rc.vim')
" Neobundle:
call s:source_rc('neobundle.rc.vim')
" Basic:
call s:source_rc('general.rc.vim')
" Encoding:
call s:source_rc('encoding.rc.vim')
" Keymappings:
call s:source_rc('mappings.rc.vim')
" Plugin:
call s:source_rc('plugins.rc.vim')
" FileType:
call s:source_rc('filetype.rc.vim')
" Custom configs
call s:source_rc('my_configs.rc.vim')

" Others
" ==============================================================================
call neobundle#call_hook('on_source')
set secure
