"TODO.vim->lua
let s:is_not_in_diff_mode = 1

function! diffmode#Toggle()
  if s:is_not_in_diff_mode
    call ToogleOn()
  else
    call ToggleOff()
  endif
endfunction

function! ToogleOn()
  windo diffthis
  windo set cursorbind scrollbind wrap
  let s:is_not_in_diff_mode = 0
endfunction

function! ToggleOff()
  set nocursorbind noscrollbind
  windo diffoff
  let s:is_not_in_diff_mode = 1
endfunction
