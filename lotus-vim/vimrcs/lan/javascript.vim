map <silent> <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Javascript .<CR>
set omnifunc=javascriptcomplete#CompleteJS
call JavaScriptFold()
setl fen
setl nocindent
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


