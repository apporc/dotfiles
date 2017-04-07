"---------------------------------------------------------------------------

" Initialize:
" ==============================================================================

" Default home directory.
let t:cwd = getcwd()

if !isdirectory(expand('~/.cache'))
  call mkdir(expand('~/.cache'), 'p')
endif

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

"
" General options
"-------------------------------------------------------------------------------
"
" Sets how many lines of history VIM has to remember
set history=1024
"disable vi compatibility (emulation of old bugs)
set nocompatible
" highlight cursor line
au BufLeave * set nocursorline nocursorcolumn
au BufEnter * set cursorline cursorcolumn

" Write the contents of the file, if it has been modified.
set autowriteall
" Set to auto read when a file is changed from the outside
set autoread
" show line number
set number
set relativenumber
" get off the default mode indicator, let airline do this.
set noshowmode
"Always show current position
set ruler
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
" Round indent by shiftwidth when << and >>
set shiftround
" Allow vim get settings from code file, like /* vim: set fc=c: */ in a c file.
"set modeline
" Allow to display another buffer when current buffer isn't saved.
set hidden
" Ignore case on insert completion.
set infercase
" If thie millionseconds, nothing is typed, save swap file.
set updatetime=1000
" Use grep.
set grepprg=grep\ -inH

"Turn on the wild menu(command-line completion with tab)
set wildmenu
" Display all the information of the tag by the supplement of the Insert mode.
" May not work well with 'longest' in completeopt
set showfulltag
" Autocomplete setting
set completeopt=longest,menuone
" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" Don't redraw while macro executing.
set lazyredraw
set ttyfast
" For regular expressions turn magic on
set magic

" Highlight matching brackets when text indicator is over the
set showmatch
" Highlight when CursorMoved.
set cpoptions-=m
" How many tenths of a second to blink when matching brackets
set matchtime=3
" Highlight <>.
set matchpairs+=<:>

" Minimal number of screen lines to keep above and below the cursor.
" This will make your cursor not go to the edge of the screen, and
" you can always see 10 lines above and below the cursor line, it's
" good for code browsing.
set scrolloff=10
" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Keymapping timeout, timeoutlen, time out time in milliseconds
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
set timeout timeoutlen=1000 ttimeoutlen=0

" Use system clipboard, not vim's buffer
" With this you can copy/paste from/to system clipboard
" unamed * register, terminal used
" unamedplus + register, chrome used
set clipboard^=unnamed,unnamedplus

" Enable virtualedit in visual block mode, so cursor can be anywhere, not only on characters.
set virtualedit=block

" Check timestamp more for 'autoread'.
autocmd MyAutoCmd WinEnter * checktime

" Disable paste automatically.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Return to last edit position when opening files (You want this!)
autocmd MyAutoCmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Call startup commands
autocmd VimEnter * call Startup()

" Files to ignore
" ------------------------------------------------------------------------------
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

" Indent, tabwidth, shiftwidth
" ------------------------------------------------------------------------------
"
" configure tabwidth and insert spaces instead of tabs, for different language it will be setl agagin.
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" use indentation of previous line
set autoindent

" Fold settings
" ------------------------------------------------------------------------------
"
" Enable folding.
set foldenable
" Show folding level.
set foldcolumn=0
" By default, don't fold code
set foldlevelstart=99
set fillchars=vert:\|
set commentstring=%s
" Foldmethod is set in lan.rc.vim according filetype.


" Search settings
" ------------------------------------------------------------------------------
"
" try all words regardless of case
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Make search act like search in modern browsers
set incsearch
" Searches wrap around the end of the file.
" set wrapscan

" Longline settings
" ------------------------------------------------------------------------------
"
" Wrap long line.
set nowrap
" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
" set textwidth=120

" Allow to move to right even on the end of the line, and move to left even on the begging of the line
set whichwrap+=h,l,<,>,[,],b,s,~

" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=>\
set breakat=\ \	;:,!?

" Swap file settings
" ------------------------------------------------------------------------------
"
" Set swap directory.
set directory=~/.local/share/nvim/swap//
" Enable swapfile for safety.
set swapfile

" Set undofile.
set undofile
let &undodir=&directory

" Turn backup off
set nobackup
set nowritebackup
" set backupdir-=.
