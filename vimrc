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
let rcpath = strpart($MYVIMRC, 0, strridx($MYVIMRC, '/'))
let userpath = rcpath . '/user'
let vundlepath = rcpath . '/bundle/vundle'
let &runtimepath = rcpath . ',' .  userpath . ',' . vundlepath . ',' . $VIMRUNTIME

" Initialize vundle for easy plugin management
set nocompatible               " be iMproved
filetype off                   " required!
call vundle#rc()

" Required setup
Bundle 'tarruda/vundle'

" Plugins
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

