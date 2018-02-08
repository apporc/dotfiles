" Functions useful
"-------------------------
"
" Selection in visual mode
function! VisualSelection(direction, extra_filter)
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc


" Javascript fold method
function! JavaScriptFold()
    setl foldmethod=syntax
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" Startup Commands
function! Startup()
endfunction

" Setting tabwidth, width normally is 2 or 4
function! SetTabWidth(width)
  execute 'setl shiftwidth=' . a:width
  execute 'setl tabstop=' . a:width
  execute 'setl softtabstop=' . a:width
endfunction

function! Disable_window_shortcut() "{{{
  nnoremap <buffer><m-x> <Nop>
  nnoremap <buffer><m-t> <Nop>
  nnoremap <buffer><m-i> <Nop>

  nnoremap <buffer><m-n> <Nop>
  nnoremap <buffer><m-p> <Nop>

  " switching to buffer 1 - 9 is mapped to ,[nOfBuffer]
  " <ESC> used to be here, it made alarm, and my leader key <space> is not working in insert mode.
  "for buffer_no in range(1, 9)
  "execute .nnoremap <buffer><Leader>. . buffer_no . . <Nop>.
  "endfor

  " switching to buffer 10 - 100 is mapped to ,0[nOfBuffer]
  "for buffer_no in range(10, 100)
  "execute .nnoremap <buffer><Leader>0. . buffer_no . . <Nop>.
  "endfor

    nnoremap <buffer><m-1> <Nop>
    nnoremap <buffer><m-2> <Nop>
    nnoremap <buffer><m-3> <Nop>
    nnoremap <buffer><m-4> <Nop>
    nnoremap <buffer><m-5> <Nop>
    nnoremap <buffer><m-6> <Nop>
    nnoremap <buffer><m-7> <Nop>
    nnoremap <buffer><m-8> <Nop>
    nnoremap <buffer><m-9> <Nop>
    nnoremap <buffer><m-0> <Nop>
    nnoremap <buffer><c-o> <Nop>
    nnoremap <buffer><c-i> <Nop>

endfunction
