" Leader mappings
let mapleader = ","
" Type , + space to clear search
nnoremap <silent> <leader><space> :noh<cr>
" Use normal metacharacters in vim searches
nnoremap / /\v
vnoremap / /\v
" Move between bracket pairs using tab
" (in normal and visual mode)
nnoremap <tab> %
vnoremap <tab> % 
" Move between splits using TAB
nnoremap <C-tab> <C-w>w
" Move single lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Move selection
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
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
