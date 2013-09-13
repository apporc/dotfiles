set fdm=syntax
map <silent> <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=C,C++ . && cscope -R -b -q -s .<CR>
"TODO: change the tags path
set tags=tags,TAGS
set omnifunc=ccomplete#Complete
"Set cscope mappings
silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
