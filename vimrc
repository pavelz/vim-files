"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title:	Vim startup file                                              "
" Author:	Thiago de Arruda                                              "
" Description:                                                                "  
"   My custom vim startup file.                                               " 
"   This file's purpose is to set directory containing itself as the runtime  "
"   path so it can be its own git repository separate from my dotfiles.       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:is_windows = has('win32') || has('win64')

" Little hack to set the $MYVIMRC from the $VIMINIT in the case it was used to 
" initialize vim.
let s:default_vimrc = 1
if empty($MYVIMRC)
  let $MYVIMRC = substitute($VIMINIT, "^source ", "", "g")
  let s:default_vimrc = 0
endif

" Extract the directory from $MYVIMRC (platform-specific)
if g:is_windows
  let g:rc_dir = strpart($MYVIMRC, 0, strridx($MYVIMRC, '\'))
  if s:default_vimrc
    " Set vimfiles as the rc_dir
    let g:rc_dir = g:rc_dir.'\vimfiles'
  endif
else
  let g:rc_dir = strpart($MYVIMRC, 0, strridx($MYVIMRC, '/'))
  if s:default_vimrc
    " Set .vim as the rc_dir
    let g:rc_dir = g:rc_dir.'/.vim'
  endif
endif

let g:user_rc_dir = g:rc_dir . '/user'
let s:vundle_dir = g:rc_dir . '/bundle/vundle'
let &runtimepath = g:rc_dir . ',' . g:user_rc_dir . ',' . s:vundle_dir . ',' . $VIMRUNTIME

filetype off " Required

" Initialize vundle for package management
call vundle#rc()
" Required setup
Bundle 'tarruda/vundle'
" Load plugins
Bundle 'tarruda/ctrlp.vim'
Bundle 'tarruda/mustache.vim'
Bundle 'tarruda/vim-javascript'
Bundle 'tarruda/vim-coffee-script'
" Snipmate
Bundle "tarruda/vim-addon-mw-utils"
Bundle "tarruda/tlib_vim"
Bundle "tarruda/snipmate-snippets"
Bundle 'tarruda/vim-snipmate'
"
Bundle 'tarruda/nerdtree'
Bundle 'tarruda/sessionman.vim'
Bundle 'tarruda/vim-addon-local-vimrc'

" Source user settings directory
let s:user_init = g:user_rc_dir . '/rc.vim'
if filereadable(s:user_init)
  exe 'source' s:user_init
endif
