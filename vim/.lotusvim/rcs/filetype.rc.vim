filetype plugin indent on

" Enable syntax color.
syntax enable

" Function to source vim configuration files.
function! s:source_filerc(path)
  execute 'source' fnameescape(expand('~/.lotusvim/rcs/filetypes/' . a:path))
endfunction

" Import filetypes setting
for i in ['general.rc.vim',
      \'bash.rc.vim',
      \'c.rc.vim',
      \'css.rc.vim',
      \'dart.rc.vim',
      \'go.rc.vim',
      \'html.rc.vim',
      \'javascript.rc.vim',
      \'markdown.rc.vim',
      \'php.rc.vim',
      \'python.rc.vim',
      \'vimscript.rc.vim',
      \'dot.rc.vim']
  call s:source_filerc(i)
endfor

"Identify languge types
"----------------------------
augroup MyAutoCmd
  autocmd Filetype c silent call Auto_C()
  autocmd Filetype cpp silent call Auto_C()
  autocmd Filetype python silent call Auto_PYTHON()
  autocmd Filetype sh silent call Auto_SH()
  autocmd Filetype js silent call Auto_JS()
  autocmd Filetype html silent call Auto_HTML()
  autocmd Filetype css silent call Auto_CSS()
  autocmd Filetype vim silent call Auto_VIM()
  autocmd Filetype php silent call Auto_PHP()
  autocmd Filetype go silent call Auto_GO()
  autocmd Filetype dart silent call Auto_Dart()
  autocmd Filetype dot silent call Auto_DOT()
augroup END
