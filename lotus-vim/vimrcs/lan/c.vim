set fdm=syntax
map <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=c,c++ .<CR>
"TODO: change the tags path
set tags=tags,TAGS,/usr/include/tags,/home/apporc/.vim/tags/c,/home/apporc/.vim/tags/cpp
set omnifunc=ccomplete#Complete
