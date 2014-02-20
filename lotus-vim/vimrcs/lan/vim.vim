" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=2 " indent also with 4 spaces
setl tabstop=2 " tab width is 4 spaces
setl softtabstop=2

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=Vim .<CR>
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
