" Mappings
" ---------------------------
"
let mapleader = ','
" Disable built-in F1 help key
noremap <F1> <Esc>
inoremap <F1> <Esc>

" Set alt keys here

if !has('nvim')
  " This h like character is not ^+[+h.
  " You should type this to produce the code:
  " in insert mode, ctrl-v first and then type alt+h
  set <m-o>=o
  set <m-h>=h
  set <m-j>=j
  set <m-k>=k
  set <m-l>=l
  set <m-w>=w
  set <m-e>=e
  set <m-a>=a
  set <m-f>=f
  set <m-b>=b
  set <m-r>=r
  set <m-t>=t
  set <m-v>=v
  set <m-g>=g
  set <m-n>=n
  set <m-p>=p
  set <m-x>=x
  set <m-i>=i
  set <m-c>=c
  set <m-1>=1
  set <m-2>=2
  set <m-3>=3
  set <m-4>=4
  set <m-5>=5
  set <m-6>=6
  set <m-7>=7
  set <m-8>=8
  set <m-9>=9
  set <m-0>=0
endif

" Set alt-o as esc, because being tired of esc.
"
inoremap <m-o> <ESC>
nnoremap <m-o> <ESC>

" Use <Leader> in global plugin.
" With a map leader it's possible to do extra key combinations
" Don't use leader key at present
" let mapleader=" "
"
" Leave insert mode quickly
inoremap <leader>j <ESC>
inoremap <leader>k <ESC>
inoremap <leader>h <ESC>
inoremap <leader>l <ESC>

inoremap <leader>a <ESC>la
inoremap <leader>i <ESC>a
inoremap <leader>A <ESC>A
inoremap <leader>I <ESC>I
inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O
inoremap <leader>v <ESC>v
inoremap <leader>x <ESC>xi
inoremap <leader>dd <ESC>dd

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

" tab to indent line
"nnoremap <tab> v>
"nnoremap <s-tab> v<
"vnoremap <tab> >gv
"vnoremap <s-tab> <gv

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
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
nnoremap <m-v> :setlocal paste!<CR>

" use alt+w to save file
nnoremap <m-w> <ESC>:<c-u>w<CR>
inoremap <m-w> <ESC>:<c-u>w<CR>

" use alt+g to jump to definition
nnoremap <silent> <m-g> <C-]>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" <Leader>s: Spell checking shortcuts, don't use this by now.
"nnoremap <Leader>ss :setlocal spell!<cr>
"nnoremap <Leader>sj ]s
"nnoremap <Leader>sk [s
"nnoremap <Leader>sa zg]s
"nnoremap <Leader>sd 1z=
"nnoremap <Leader>sf z=

" F11 to delete trailing spaces.
nnoremap <F9> :call DeleteTrailingWS()<CR>

" function to run shell command silently
" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" open chromium to see markdown
nnoremap <silent> <m-c> :Silent chromium "%:p"<CR>
