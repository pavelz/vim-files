" Appearance settings for gvim
if has('gui_running')
  colorscheme twilight_darker
  if g:is_windows
    set guifont=Consolas:h12
  else
    set guifont=Monospace\ 14
  endif
  " Remove menu bar
  set guioptions-=m
  " Remove toolbar
  set guioptions-=T
endif 
