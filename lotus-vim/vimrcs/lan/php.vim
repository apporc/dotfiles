set fdm=syntax
map <silent> <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=php .<CR>
"TODO: change the tags path
set tags=tags,TAGS,/usr/include/tags
set omnifunc=phpcomplete#Complete
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim

