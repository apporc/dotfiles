" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=4 " indent also with 4 spaces
setl tabstop=4 " tab width is 4 spaces
setl softtabstop=4

call DeleteTrailingWS()
setl fdm=indent

" disable intelligent indentation for python, or the cursor magically show at the head of one new line when commenting.
setl nosmartindent

"This silent won't work, don't know why.
map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Python . && pycscope -R .<CR>
setl omnifunc=pythoncomplete#Complete
silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


