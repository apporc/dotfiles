"This is for nerdtree.
"------------------------------------
autocmd FileType nerdtree setlocal number
autocmd FileType nerdtree setlocal modifiable
let NERDTreeWinSize=20
let NERDTreeIgnore=['\.o$','\.bak$','\.pyc$']
map <F6> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>

