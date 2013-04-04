"Identify languge types
"----------------------------
filetype on
au BufNewFile,BufRead *.c,*.h setf c
au BufNewFile,BufRead *.py,*.pyw setf python
au BufNewFile,BufRead *.sh setf sh
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.html setf html
au BufNewFile,BufRead *.css setf css

autocmd Filetype c silent source ~/.lotus_vim/vimrcs/lan/c.vim
autocmd Filetype python silent source ~/.lotus_vim/vimrcs/lan/python.vim
autocmd Filetype sh silent source ~/.lotus_vim/vimrcs/lan/sh.vim
autocmd Filetype sh silent source ~/.lotus_vim/vimrcs/lan/javascript.vim
autocmd Filetype sh silent source ~/.lotus_vim/vimrcs/lan/html.vim
autocmd Filetype sh silent source ~/.lotus_vim/vimrcs/lan/css.vim
