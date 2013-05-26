"Cancel mappings for some language buffer windows here.
"
" disable F3 shell open command
map <buffer> <F3> :echo "Opening shell in this window is not allowed"<CR>

" disable mapleader in sidebars(nerdtree, tagbar)
" unlet mapleader
