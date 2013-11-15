" Mappings
" ---------------------------
"
" Disable built-in F1 help key 
map <F1> <Esc>
imap <F1> <Esc>"

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" tab to indent line
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv 
vmap <s-tab> <gv 

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" command line key shortcut
cmap    <c-a>   <home>
cmap    <c-e>   <end>
cnoremap <c-b>  <left>
cnoremap <c-d>  <del>
cnoremap <c-f>  <right>
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
cnoremap    <esc><c-b> <s-left>
cnoremap    <esc><c-f> <s-right>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','


" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
" Can't map this in imap, because when paste option is on, imap is disabled.
map <leader>p :setlocal paste!<CR>

" use ',w' to save file
nmap <leader>w :w<CR>

" goto definition with ',j'
map <silent> <leader>j <C-]>

" map F4 to save and close current buffer, this is too dangerous
""map <F4> :w<CR>:bd<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"Open a shell splitwindow
map <leader>t :ConqueTermSplit bash<CR><ESC>:resize 10<CR>i

