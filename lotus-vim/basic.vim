" General options
"--------------------------
"
" Sets how many lines of history VIM has to remember
set history=1024

"disable vi compatibility (emulation of old bugs)
set nocompatible

" Write the contents of the file, if it has been modified.
set autowriteall

" Set to auto read when a file is changed from the outside
set autoread

" allow mouse
set mouse=a

" Enable filetype plugins
filetype plugin indent on

" show line number
set number

" show current mode
set showmode

" Show (partial) command in the last line of the screen
set showcmd

" Show filename as window title
set title

"Turn on the wild menu(command-line completion with tab)
set wildmenu

"Always show current position
set ruler

" Minimal number of screen lines to keep above and below the cursor.
" This will make your cursor not go to the edge of the screen, and
" you can always see 10 lines above and below the cursor line, it's
" good for code browsing.
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Display unprintable chars
" set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
" set showbreak=↪

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Highlight matching brackets when text indicator is over the
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" timeoutlen        time out time in milliseconds
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
" By default, don't fold code
set foldlevelstart=99

" configure tabwidth and insert spaces instead of tabs, for different language it will be setl agagin.
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

" Turn backup off
set nobackup

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set lbr
set textwidth=120

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" Always show the status line
set laststatus=2

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Use system clipboard, not vim's buffer
" With this you can copy/paste from/to system clipboard
" First make sure your vim support clipboard option, with 'vim --version|grep clipboard'
" It should have +clipboard and +xterm_clipboard
" With Ubuntu, you may need to install vim-gnome instead of the default vim package.
" It made chinese garbled, give up at present.
if has ('unnamedplus')
    set clipboard=unnamedplus
  else
      set clipboard=unnamed
    endif

" Auto completion
" -------------------------------
"
" Autocomplete setting
set completeopt=longest,menuone

" try all words regardless of case
set ignorecase
" When searching try to be smart about cases
set smartcase

