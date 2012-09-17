" Ignore some file patterns when searching with FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class|\.pyc$'
let g:fuf_maxMenuWidth = 150
" Fuzzy find
map <leader>p :call ProjectFuzzyFind()<CR>
