" Appearance settings for gvim
if has('gui_running')
    " Remove menu bar
    set guioptions-=m
    " Remove toolbar
    set guioptions-=T
    set guifont=Monospace\ 14
    colorscheme twilight
endif 
