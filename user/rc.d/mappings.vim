" Leader mappings
let mapleader = ","
" Type , + space to clear search
nnoremap <silent> <leader><space> :noh<cr>
" Workaround for terminals that arent compatible with the way
" vim understands alt key combinations. From
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
if ! has('gui_running') " GVim handles alt keys itself
  let s:c='a'
  while s:c <= 'z'
    exec "set <A-".s:c.">=\e".s:c
    exec "map \e".s:c." <A-".s:c.">"
    let s:c = nr2char(1+char2nr(s:c))
  endwhile
  set timeout ttimeoutlen=50
endif
" Fold using F9
nnoremap <F9> za
" Use normal metacharacters in vim searches
nnoremap / /\v
vnoremap / /\v
" Move between bracket pairs using tab
" (in normal and visual mode)
nnoremap <tab> %
vnoremap <tab> % 
" Move between splits using TAB
nnoremap <C-tab> <C-w>w
" Page up/down
nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
" Easily move lines
nnoremap <silent> <A-j> :silent! m .+1<CR>==
nnoremap <silent> <A-k> :silent! m .-2<CR>==
vnoremap <silent> <A-j> :silent! m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :silent! m '<-2<CR>gv=gv
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
