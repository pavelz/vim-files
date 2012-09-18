set wildignore+=*.o,*.so,*.dll,*.exe,*.bak,*.swp,*.class,*.pyc,*.pyd,*.pyo,*~
set wildignore+=*.zip,*.tgz,*.gz,*.bz2,*.lz,*.rar,*.7z

let g:ctrlp_cmd = 'Ctrlp'

fun! s:search()
  SourceLocalVimrcOnce
  CtrlP
endf

command Ctrlp call s:search()
