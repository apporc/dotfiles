" configure tabwidth and insert spaces instead of tabs
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Javascript .<CR>
set omnifunc=javascriptcomplete#CompleteJS
call JavaScriptFold()
setl fen
setl nocindent
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
