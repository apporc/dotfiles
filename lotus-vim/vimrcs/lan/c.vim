
" configure tabwidth and insert spaces instead of tabs
setl shiftwidth=4 " indent also with 4 spaces
setl tabstop=4 " tab width is 4 spaces
setl softtabstop=4

setl fdm=syntax

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=C,C++ . && cscope -R -b -q -s .<CR>
setl omnifunc=ccomplete#Complete
"Set cscope mappings
silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
