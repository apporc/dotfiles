" Maintainer: 
"           apporc
" Email: 
"           appleorchard2000@gmail.com
"
" Website:
"           www.apporc.org
"
" Version:
"           0.1
"
" Thanks:
"           Amir Salihefendic(https://github.com/amix)
"           cz848(https://github.com/cz848)
"
" General options
"--------------------------
"
" Sets how many lines of history VIM has to remember
set history=1024

"disable vi compatibility (emulation of old bugs)
set nocompatible

" intelligent comments
set autowrite

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

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

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

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

" Turn backup off
set nobackup

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" configure tabwidth and insert spaces instead of tabs
set shiftwidth=4 " indent also with 4 spaces
set tabstop=4 " tab width is 4 spaces
set softtabstop=4

" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set lbr
set textwidth=120

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

