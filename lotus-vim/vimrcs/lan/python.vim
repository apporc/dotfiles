" configure tabwidth and insert spaces instead of tabs
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

call DeleteTrailingWS()
set fdm=indent
"This silent won't work, don't know why.
map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python . && pycscope -R .<CR>
set omnifunc=pythoncomplete#Complete
silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


