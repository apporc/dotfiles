set fdm=syntax
map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=php .<CR>
set omnifunc=phpcomplete#Complete
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim

