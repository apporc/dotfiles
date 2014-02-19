
" configure tabwidth and insert spaces instead of tabs
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

set fdm=syntax

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=C,C++ . && cscope -R -b -q -s .<CR>
set omnifunc=ccomplete#Complete
"Set cscope mappings
silent source ~/.lotus_vim/vimrcs/plugins/cscope.vim
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim
