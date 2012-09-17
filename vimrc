"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title:	Vim startup file                                              "
" Author:	Thiago de Arruda                                              "
" Description:                                                                "  
"   My custom vim startup file.                                               " 
"   This file's purpose is to set directory containing itself as the runtime  "
"   path so it can be its own git repository separate from my dotfiles.       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Little hack to set the $MYVIMRC from the $VIMINIT in the case it only
" contains a source command
if empty($MYVIMRC)
    let $MYVIMRC = substitute($VIMINIT, "^source ", "", "g")
endif

" Using some string functions to extract the directory from $MYVIMRC
let rc_dir = strpart($MYVIMRC, 0, strridx($MYVIMRC, '/'))
" Put vundle and user rc dir to the runtime
let user_rc_dir = rc_dir . '/user'
let s:vundle_dir = rc_dir . '/bundle/vundle'
let &runtimepath = rc_dir . ',' . user_rc_dir . ',' . s:vundle_dir . ',' . $VIMRUNTIME

filetype off " Required

" Initialize vundle for package management
call vundle#rc()
" Required setup
Bundle 'tarruda/vundle'
" Load plugins
Bundle 'tarruda/L9'
Bundle 'tarruda/FuzzyFinder'
Bundle 'tarruda/mustache.vim'
Bundle 'tarruda/vim-javascript'
Bundle 'tarruda/vim-coffee-script'
Bundle "tarruda/vim-addon-mw-utils"
Bundle "tarruda/tlib_vim"
Bundle "tarruda/snipmate-snippets"
Bundle 'tarruda/vim-snipmate'
Bundle 'tarruda/nerdtree'
Bundle 'tarruda/sessionman.vim'

" Source user settings directory
let s:user_init = user_rc_dir . '/rc.vim'
if filereadable(s:user_init)
    exe 'source' s:user_init
endif
