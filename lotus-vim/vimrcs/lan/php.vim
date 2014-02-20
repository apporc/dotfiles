" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=4 " indent also with 4 spaces
setl tabstop=4 " tab width is 4 spaces
setl softtabstop=4

setl fdm=syntax
map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=php .<CR>
setl omnifunc=phpcomplete#Complete
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim

