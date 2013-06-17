call DeleteTrailingWS()
set fdm=indent
"This silent won't work, don't know why.
map <silent> <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python .<CR>
set tags=tags,TAGS
"let g:pydiction_location = '/usr/share/vim/vim73/ftplugin/pydiction-1.2/complete-dict'
"let g:pydiction_menu_height = 20
set omnifunc=pythoncomplete#Complete

"toggle indent guides for python script
IndentGuidesToggle


silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim



