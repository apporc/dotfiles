" configure tabwidth and insert spaces instead of tabs
set shiftwidth=2 " indent also with 2 spaces
set tabstop=2 " tab width is 2 spaces
set softtabstop=2

map <silent> <leader>u :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=HTML .<CR>
set omnifunc=htmlcomplete#CompleteTags
silent source ~/.lotus_vim/vimrcs/lan/ylanmap.vim


