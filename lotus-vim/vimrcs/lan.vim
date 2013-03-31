"Identify languge types
"----------------------------
filetype on
au BufNewFile,BufRead *.c,*.h setf c
au BufNewFile,BufRead *.py,*.pyw setf python
au BufNewFile,BufRead *.sh setf sh
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.html setf html
au BufNewFile,BufRead *.css setf css

autocmd Filetype c source ~/.lotus_vim/vimrcs/lan/c.vim
autocmd Filetype python source ~/.lotus_vim/vimrcs/lan/python.vim
autocmd Filetype sh source ~/.lotus_vim/vimrcs/lan/sh.vim
