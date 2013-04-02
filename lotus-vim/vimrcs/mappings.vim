" Mappings
" ---------------------------
"
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <F3> :setlocal paste!<cr>

" other map
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv 
vmap <s-tab> <gv 
cmap    <c-a>   <home>
cmap    <c-e>   <end>
cnoremap <c-b>  <left>
cnoremap <c-d>  <del>
cnoremap <c-f>  <right>
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
cnoremap    <esc><c-b> <s-left>
cnoremap    <esc><c-f> <s-right>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" goto definition with F12
map <F12> <C-]>
set cscopetag

"Open a shell splitwindow
map <F1> :belowright 10split<CR>:ConqueTermSplit bash<CR>
