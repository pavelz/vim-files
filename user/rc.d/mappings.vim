" Leader key
let mapleader = ","
" Toggle tab list
nnoremap <silent> <F8> :TlistToggle<CR>
" Fold using F9
nnoremap <F9> za
" Map omni completion to Ctrl + SPACE
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif
