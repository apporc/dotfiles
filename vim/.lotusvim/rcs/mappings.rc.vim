" Mappings
" ---------------------------
"
let mapleader = ','
" Disable built-in F1 help key
noremap <F1> <Esc>
inoremap <F1> <Esc>

" Set alt-o as esc, because being tired of esc.
"
inoremap <m-o> <ESC>
nnoremap <m-o> <ESC>

" Leave insert mode quickly
inoremap <leader>j <ESC>j
inoremap <leader>k <ESC>k
inoremap <leader>h <ESC>h
inoremap <leader>l <ESC>l

inoremap <leader>a <ESC>la
inoremap <leader>i <ESC>a
inoremap <leader>A <ESC>A
inoremap <leader>I <ESC>I
inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O
inoremap <leader>v <ESC>v
inoremap <leader>x <ESC>xi
inoremap <leader>dd <ESC>dd
inoremap <leader>dw <ESC>dw
inoremap <leader>db <ESC>db

inoremap <leader>e <ESC>e
inoremap <leader>w <ESC>w
inoremap <leader>b <ESC>b
inoremap <leader>0 <ESC>0
inoremap <leader>f <ESC>f
inoremap <leader>t <ESC>t
inoremap <leader>? <ESC>?
inoremap <leader>n <ESC>n

inoremap <leader>y <ESC>Y
inoremap <leader>p <ESC>p
inoremap <leader>u <ESC>u

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Smart way to move between windows
"
nnoremap <m-h> <C-w>h
nnoremap <m-j> <C-w>j
nnoremap <m-k> <C-w>k
nnoremap <m-l> <C-w>l
inoremap <m-h> <ESC><C-w>h
inoremap <m-j> <ESC><C-w>j
inoremap <m-k> <ESC><C-w>k
inoremap <m-l> <ESC><C-w>l
if has('nvim')
    tnoremap <m-h> <C-\><C-n><C-w>h
    tnoremap <m-j> <C-\><C-n><C-w>j
    tnoremap <m-k> <C-\><C-n><C-w>k
    tnoremap <m-l> <C-\><C-n><C-w>l
endif

" command line key shortcut
cnoremap <c-a>   <home>
cnoremap <c-e>   <end>
cnoremap <c-b>  <left>
cnoremap <c-d>  <del>
cnoremap <c-f>  <right>
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
cnoremap <esc><c-b> <s-left>
cnoremap <esc><c-f> <s-right>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
nnoremap <m-v> :setlocal paste!<CR>

" use alt+w to save file
nnoremap <m-w> :<c-u>w<CR>
inoremap <m-w> <ESC>:<c-u>w<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" F11 to delete trailing spaces.
nnoremap <F9> :call DeleteTrailingWS()<CR>

" function to run shell command silently
" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" open chromium to see markdown
nnoremap <silent> <m-c> :Silent chromium "%:p"<CR>
