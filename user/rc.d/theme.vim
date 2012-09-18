" Appearance settings for gvim
if has('gui_running')
  colorscheme twilight
  if g:is_windows
    set guifont=Lucida_Console \14
  else
    set guifont=Monospace\ 14
  endif
  " Remove menu bar
  set guioptions-=m
  " Remove toolbar
  set guioptions-=T
endif 
