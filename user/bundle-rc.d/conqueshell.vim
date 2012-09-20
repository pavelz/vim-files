let s:sending_text = 0
let s:temp_function_name = 0

" Send all text in buffer to conqueterm.
" Based on 'conque_term#send_selected'
fun! SendTextToConque(mode) 
  if s:sending_text
    return
  endif
  let s:sending_text = 1
  " get current buffer name
  let buffer_name = expand('%')
  " get most recent/relevant terminal
  let term = conque_term#get_instance()
  " Test the current mode to paste correctly in the term
  if a:mode == 2
    " Visual mode, get lines selected and if needed, strip the start/end 
    " of the first/last lines respectively.
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let text = getline(lnum1, lnum2)
    let text[0] = text[0][col1-1 :]
    let text[-1] = text[-1][: col2]
  else
    let text = getline(1,'$')
  endif
  call term.focus()
  for line in text
    call term.writeln(line)
  endfor
  call term.write("\n")
  " scroll buffer left
  startinsert!
  normal! 0zH
  " wait for the window update, then switch back
  " to the previous buffer
  call s:set_timeout(1, 'SwitchBack', [buffer_name, a:mode])
endfun

fun! SwitchBack(buffer_name, mode) 
  let save_sb = &switchbuf
  sil set switchbuf=usetab
  exe 'sb ' . a:buffer_name
  let &switchbuf = save_sb
  if a:mode > 0
    stopinsert " Stop insert if was in normal or visual mode
    if a:mode == 2
      " Reselect text previous selected
      exe "normal! gvl"
    endif
  endif
endfun

fun! s:reset()
  let s:sending_text = 0
  let &updatetime = s:saved_updatetime
  augroup set_timeout
    autocmd!
  augroup END
endfun

fun! s:set_timeout(milliseconds, F, args)
  let s:temp_function_name = a:F
  let s:temp_function_args = a:args
  let s:saved_updatetime = &updatetime 
  let &updatetime=a:milliseconds
  augroup set_timeout
    autocmd!
    autocmd CursorHoldI * call call(s:temp_function_name, s:temp_function_args) | call s:reset()
  augroup END
endfun

inoremap <silent> <F5> <ESC>:call SendTextToConque(0)<CR>
nnoremap <silent> <F5> :call SendTextToConque(1)<CR>
vnoremap <silent> <F5> :call SendTextToConque(2)<CR>

