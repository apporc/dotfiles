" Mappings
" ---------------------------
"
" Disable built-in F1 help key
noremap <F1> <Esc>
inoremap <F1> <Esc>"

" Use <Leader> in global plugin.
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" "

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" tab to indent line
nnoremap <tab> v>
nnoremap <s-tab> v<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

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

" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
" Can't map this in imap, because when paste option is on, imap is disabled.
nnoremap <leader>p :setlocal paste!<CR>

" use <leader>w to save file
nnoremap <leader>w :w<CR>

" use <leader>g to jump to definition
nnoremap <silent> <leader>g <C-]>

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
