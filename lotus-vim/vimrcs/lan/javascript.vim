" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=4 " indent also with 4 spaces
setl tabstop=4 " tab width is 4 spaces
setl softtabstop=4

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Javascript .<CR>
setl omnifunc=javascriptcomplete#CompleteJS
call JavaScriptFold()
setl fen
setl nocindent
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
