set encoding=utf-8
set ffs=unix,dos,mac

" Setting of terminal encoding."{{{
if !has('gui_running')
  if &term ==# 'win32' &&
        \ (v:version < 703 || (v:version == 703 && has('patch814')))
    " Garbled unless set this.
    set termencoding=cp932
    set encoding=gb18030
  else
    if $ENV_ACCESS ==# 'linux'
      set termencoding=utf-8
    elseif $ENV_ACCESS ==# 'colinux'
      set termencoding=utf-8
    else  " fallback
      set termencoding=  " same as 'encoding'
    endif
  endif
elseif IsWindows()
  " For system.
  set termencoding=cp932
endif
"}}}

" Set encoding for chinese
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,cp932,big5,euc-jp,euc-kr,latin1,chinese
