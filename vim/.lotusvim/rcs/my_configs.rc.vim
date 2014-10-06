" Add Project Dependent Library Tags
set tags+=./.libtags,./.tags
" Add Project Dependent Library Cscope
if filereadable('./.libcscope')
  cs add ./.libcscope
endif
if filereadable('./.cscope')
  cs add ./.cscope
endif
