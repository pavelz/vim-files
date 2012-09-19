" Enable VIM features
set nocompatible
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
" Shows line numbers
set number
" Global tab settings
set expandtab
set tabstop=8
" Disable a feature I neveruse
set modelines=0
" Show relative line numbers(better for navigating with motion quantifiers)
set relativenumber
" Creates <FILENAME>.un~ for undoing changes after closing files
set undofile
" Search options:
" - Ignore case if all characters in pattern are lowercase
set ignorecase
set smartcase
" Better search feedback
set incsearch
set showmatch
set hlsearch
" Wrap text automatically
set wrap
" Normal text width
set textwidth=79
" Folding setup
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
" Enable syntax highlighting
syntax on
" Enable filetype-specific settings
filetype plugin indent on
" Script directory
" Load user settings
let s:user_rc_files = user_rc_dir . '/rc.d/**/*.vim'
for f in split(glob(s:user_rc_files), '\n')
  exe 'source' f
endfor
" Load user bundle-specific settings
let s:bundle_rc_files = user_rc_dir . '/bundle-rc.d/**/*.vim'
for f in split(glob(s:bundle_rc_files), '\n')
  exe 'source' f
endfor
