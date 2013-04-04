call DeleteTrailingWS()
set fdm=indent
map <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python .<CR>
set tags=tags,TAGS
"let g:pydiction_location = '/usr/share/vim/vim73/ftplugin/pydiction-1.2/complete-dict'
"let g:pydiction_menu_height = 20
set omnifunc=pythoncomplete#Complete
