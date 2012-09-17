""" General settings

" Allows backspacing over everything in insert mode
set backspace=indent,eol,start
" Disable backup
set nobackup
" Swap file settings (used for recovery)
set dir=.,/tmp
" keep 500 lines of command line history
set history=500
" show the cursor position all the time
set ruler	
" display incomplete commands
set showcmd
" do incremental searching
set incsearch
" use highlighting when searching
set hlsearch 
" Shows line numbers
set number
" Enable syntax highlighting
syntax on
" Enable filetype-specific settings
filetype plugin indent on
" Close VIM if NERDTree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Ignore some file patterns when searching with FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class$'
