map <silent> <F5> :!ctags -R --sort=yes --fields=+iaS --extra=+q --languages=HTML .<CR>
set omnifunc=htmlcomplete#CompleteTags
