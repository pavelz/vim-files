" Leader mappings
let mapleader = ","
" Type , + space to clear search
nnoremap <leader><space> :noh<cr>
" Toggle tab list
nnoremap <silent> <F8> :TlistToggle<CR>
" Fold using F9
nnoremap <F9> za
" Use normal metacharacters in vim searches
nnoremap / /\v
vnoremap / /\v
" Move between bracket pairs using tab
" (in normal and visual mode)
nnoremap <tab> %
vnoremap <tab> % 
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
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
