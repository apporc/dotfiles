call DeleteTrailingWS()
set fdm=indent
"This silent won't work, don't know why.
map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python . && pycscope -R .<CR>
set tags=tags,TAGS
set omnifunc=pythoncomplete#Complete

silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


