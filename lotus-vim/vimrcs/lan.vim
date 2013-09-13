"Identify languge types
"----------------------------
filetype on
au BufNewFile,BufRead *.c,*.h setf <buffer> c
au BufNewFile,BufRead *.py,*.pyw setf <buffer> python
au BufNewFile,BufRead *.sh setf <buffer> sh
au BufNewFile,BufRead *.js setf <buffer> javascript
au BufNewFile,BufRead *.html setf <buffer> html
au BufNewFile,BufRead *.css setf <buffer> css
au BufNewFile,BufRead *.php setf <buffer> php

autocmd Filetype c silent source ~/.lotus_vim/vimrcs/lan/c.vim
autocmd Filetype python silent source ~/.lotus_vim/vimrcs/lan/python.vim
autocmd Filetype sh silent source ~/.lotus_vim/vimrcs/lan/sh.vim
autocmd Filetype js silent source ~/.lotus_vim/vimrcs/lan/javascript.vim
autocmd Filetype html silent source ~/.lotus_vim/vimrcs/lan/html.vim
autocmd Filetype css silent source ~/.lotus_vim/vimrcs/lan/css.vim
autocmd Filetype vim silent source ~/.lotus_vim/vimrcs/lan/vim.vim
autocmd Filetype tagbar silent source ~/.lotus_vim/vimrcs/lan/tagbar.vim
autocmd Filetype nerdtree silent source ~/.lotus_vim/vimrcs/lan/nerdtree.vim
autocmd Filetype php silent source ~/.lotus_vim/vimrcs/lan/php.vim
