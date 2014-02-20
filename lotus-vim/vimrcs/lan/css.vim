" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=2 " indent also with 2 spaces
setl tabstop=2 " tab width is 2 spaces
setl softtabstop=2

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=HTML .<CR>
setl omnifunc=csscomplete#CompleteCS
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


