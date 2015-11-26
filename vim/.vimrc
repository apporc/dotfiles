" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

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
call s:source_rc('vundle.rc.vim')
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
