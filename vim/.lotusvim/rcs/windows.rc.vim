" Show filename as window title
set title

" split to below adn right
set splitbelow
set splitright

" The most comfortable colorscheme in fact is default.
colorscheme grb256

set background=dark

" 256bit terminal
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Command Line, Tab Line and Status Line Settings
" ------------------------------------------------------------------------------
"
" Show (partial) command in the last line of the screen
set showcmd
" Always show the status line
set laststatus=2
" Height of command line.
set cmdheight=2


" ------------------
"" vim-airline
" ------------------


" Every time opening a ConqueTerm window, it will have a new name like 'zsh - xx'
let zsh_buf_names = []
for zsh_no in range(1, 100)
    let zsh_buf_names = zsh_buf_names + ["zsh - " . zsh_no]
endfor

let g:airline#extensions#tabline#excludes = ['__Tagbar__', 'vimfiler:explorer', 'denite'] + zsh_buf_names

let g:airline_powerline_fonts = 0

" enable/disable enhanced tabline.
let g:airline#extensions#tabline#enabled = 1

" virtualenv
let g:airline#extensions#virtualenv#enabled = 1

let g:airline#extensions#tabline#show_tabs = 1

" enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#show_tab_nr = 1

" defines the name of a formatter for how buffer names are displayed.
let g:airline#extensions#tabline#formatter = 'default'

" enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#enabled = 1

" configure whether buffer numbers should be shown.
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure the formatting of filenames (see |filename-modifiers|).
let g:airline#extensions#tabline#fnamemod = ':p:.'
" configure collapsing parent directories in buffer name.
let g:airline#extensions#tabline#fnamecollapse = 1

" configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#tabline#buffer_min_count = 1


" configure separators for the tabline only.
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


function! SwitchToNextBuffer(incr, split)
    let current = bufnr("%")
    let last = bufnr("$")
    let new = current + a:incr
    while 1
        if new < 1
            let new = last
        elseif new > last
            let new = 1
        endif
        if new != 0 && bufexists(new) && buflisted(new) && (getbufvar(new, "&filetype") != 'help')
            if new == current
                break
            else
                if a:split == "vsplit"
                    execute ":vsplit"
                elseif a:split == "split"
                    execute ":split"
                endif
                execute ":buffer ".new
                break
            endif
        endif
        let new = new + a:incr
    endwhile
endfunction

function! SwitchToBuffer(number, split)
    let current = bufnr("%")
    let new = a:number
    if new != 0 && bufexists(new) && buflisted(new) && (getbufvar(new, "&filetype") != 'help')
        if new != current
            if a:split == "vsplit"
                execute ":vsplit"
            elseif a:split == "split"
                execute ":split"
            endif
            execute ":buffer ".new
        endif
    endif
endfunction

nnoremap  <m-n> :call SwitchToNextBuffer(1, "nosplit")<CR>
nnoremap  <m-s-n> :call SwitchToNextBuffer(1, "vsplit")<CR>
nnoremap  <m-p> :call SwitchToNextBuffer(-1, "nosplit")<CR>
nnoremap  <m-s-p> :call SwitchToNextBuffer(-1, "vsplit")<CR>
inoremap  <m-n> <ESC>:call SwitchToNextBuffer(1, "nosplit")<CR>
inoremap  <m-s-n> <ESC>:call SwitchToNextBuffer(1, "vsplit")<CR>
inoremap  <m-p> <ESC>:call SwitchToNextBuffer(-1, "nosplit")<CR>
inoremap  <m-s-p> <ESC>:call SwitchToNextBuffer(-1, "vsplit")<CR>
if has('nvim')
  tnoremap  <m-n> <C-\><C-n>:call SwitchToNextBuffer(1, "nosplit")<CR>
  tnoremap  <m-s-n> <C-\><C-n>:call SwitchToNextBuffer(1, "vsplit")<CR>
  tnoremap  <m-p> <C-\><C-n>:call SwitchToNextBuffer(-1, "nosplit")<CR>
  tnoremap  <m-s-p> <C-\><C-n>:call SwitchToNextBuffer(-1, "vsplit")<CR>
endif

" switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
" <ESC> used to be here, it made alarm, and my leader key <space> is not working in insert mode.
"for buffer_no in range(1, 9)
"  execute 'map <leader>' . buffer_no . ' :<c-u>b' . buffer_no . '<CR>'
"endfor

" switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
"for buffer_no in range(10, 100)
"  execute 'nnoremap <leader>0' . buffer_no . ' :<c-u>b' . buffer_no . '<CR>'
"endfor

" Use alt key to switch between buffers, can't switch to buffer numbers large than 10 by now
nnoremap <m-1> :call SwitchToBuffer(1, "nosplit")<CR>
nnoremap <m-2> :call SwitchToBuffer(2, "nosplit")<CR>
nnoremap <m-3> :call SwitchToBuffer(3, "nosplit")<CR>
nnoremap <m-4> :call SwitchToBuffer(4, "nosplit")<CR>
nnoremap <m-5> :call SwitchToBuffer(5, "nosplit")<CR>
nnoremap <m-6> :call SwitchToBuffer(6, "nosplit")<CR>
nnoremap <m-7> :call SwitchToBuffer(7, "nosplit")<CR>
nnoremap <m-8> :call SwitchToBuffer(8, "nosplit")<CR>
nnoremap <m-9> :call SwitchToBuffer(9, "nosplit")<CR>

nnoremap <m-!> :call SwitchToBuffer(1, "vsplit")<CR>
nnoremap <m-@> :call SwitchToBuffer(2, "vsplit")<CR>
nnoremap <m-#> :call SwitchToBuffer(3, "vsplit")<CR>
nnoremap <m-$> :call SwitchToBuffer(4, "vsplit")<CR>
nnoremap <m-%> :call SwitchToBuffer(5, "vsplit")<CR>
nnoremap <m-^> :call SwitchToBuffer(6, "vsplit")<CR>
nnoremap <m-&> :call SwitchToBuffer(7, "vsplit")<CR>
nnoremap <m-*> :call SwitchToBuffer(8, "vsplit")<CR>
nnoremap <m-(> :call SwitchToBuffer(9, "vsplit")<CR>


" ------------------
"  vim-bbye
" ------------------
" Close current buffer, but preserve the window.
nnoremap <m-x> :Bdelete!<CR>

" ------------------
"  BufOnly
" ------------------
" Close all buffers but the current one.
nnoremap <m-i> :BufOnly<CR>

" ------------------
"" Nerdtree
" ------------------
"
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.svn', '\.hg', '\.o$','\.bak$','\.pyc$']

function! s:nerdtree_my_settings()
  setlocal number
  call Disable_window_shortcut()
endfunction
autocmd MyAutoCmd FileType nerdtree call s:nerdtree_my_settings()

" Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <m-e> :NERDTreeToggle<CR>

" ------------------
"  Tagbar
" ------------------
"
nnoremap <m-a> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_sort = 0

autocmd MyAutoCmd FileType tagbar call s:tagbar_my_settings()
function! s:tagbar_my_settings() "{{{
  call Disable_window_shortcut()
endfunction
"}}}

" ------------------
" Terminal
" ------------------
"
" use neovim's own terminal
nnoremap <m-t> :vsplit term://zsh<CR>
nnoremap <m-s-t> :split term://zsh<CR>
" automatically go to insert mode
autocmd BufWinEnter,WinEnter term://* startinsert
" automatically go to normal mode
autocmd BufLeave term://* stopinsert

" ------------------
"  Denite
" ------------------
" Set up some custom ignores
call denite#custom#source('file_rec,file_rec,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '.*',
      \ '*.pyc',
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ '.tox/',
      \ 'build/',
      \ 'dist/',
      \ '.eggs/',
      \ ], '\|'))
call denite#custom#source('file_rec,file_rec,file_mru,file,buffer,grep',
      \ 'max_candidates', 1000)

" custom grep
call denite#custom#var('grep', 'command', ['grep'])
call denite#custom#var('grep', 'default_opts', ['-inH'])
call denite#custom#var('grep', 'recursive_opts', ['-r'])
call denite#custom#var('grep', 'pattern_opt', ['-e'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', ['.'])

" Change mappings.
call denite#custom#map(
        \ 'insert',
        \ '<C-j>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
call denite#custom#map(
        \ 'insert',
        \ '<C-k>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)

  " insert mode key mappings
call denite#custom#map('insert', '<C-a>', '<denite:move_caret_to_head>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:paste_from_register>', 'noremap')
call denite#custom#map('insert', 'kk', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', '<M-q>', '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<M-b>', '<denite:move_caret_to_one_word_left>', 'noremap')
call denite#custom#map('insert', '<M-f>', '<denite:move_caret_to_one_word_right>', 'noremap')
call denite#custom#map('insert', '<M-d>', '<denite:delete_word_under_caret>', 'noremap')
call denite#custom#map('insert', '<M-c>', '<denite:delete_entire_text>', 'noremap')

" General fuzzy search
nnoremap <silent> <leader>s :<C-u>Denite
      \ -buffer-name=files buffer file_mru file_rec<CR>

" Quick registers
nnoremap <silent> <leader>r :<C-u>Denite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> <leader>u :<C-u>Denite -buffer-name=buffers buffer file_mru<CR>

" Quick file search
nnoremap <silent> <leader>f :<C-u>Denite -buffer-name=files file_rec<CR>

" Quick grep from cwd with the word under cursor
nnoremap <silent> <leader>g :<C-u>DeniteCursorWord -buffer-name=grep -no-empty grep<CR>

" Quick line using the word under cursor
nnoremap <silent> <leader>l :<C-u>DeniteCursorWord -buffer-name=search_file line<CR>
