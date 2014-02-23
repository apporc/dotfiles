" Mappings
" ---------------------------
"
" Disable built-in F1 help key
noremap <F1> <Esc>
inoremap <F1> <Esc>"

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" tab to indent line
nnoremap <tab> v>
nnoremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" command line key shortcut
cnoremap    <c-a>   <home>
cnoremap    <c-e>   <end>
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
noremap <leader>p :setlocal paste!<CR>

" use ',w' to save file
nnoremap <leader>w :w<CR>

" goto definition with ',j'
noremap <silent> <leader>j <C-]>

" map F4 to save and close current buffer, this is too dangerous
""map <F4> :w<CR>:bd<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=
