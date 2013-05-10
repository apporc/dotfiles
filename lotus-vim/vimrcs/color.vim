"unicode Color
" -----------------------------
" Enable syntax highlighting
syntax on

try
    colorscheme delek
catch
    colorscheme default
endtry

" set background=dark

" Set number of colors
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

