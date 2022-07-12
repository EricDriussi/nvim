" Built-in Terminal
let s:term_buf = 0
let s:term_win = 0

function! VertTermToggle()
  if win_gotoid(s:term_win)
    hide
  else
    wincmd l
    wincmd l
    vert new
    exec "vertical resize " . (&columns * 2/5)
    try
      exec "buffer " . s:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
      set nospell nonumber norelativenumber signcolumn=no
    endtry
    startinsert!
    let s:term_win = win_getid()
  endif
endfunction

function! HorTermToggle()
  if win_gotoid(s:term_win)
    hide
  else
    botright new
    exec "resize " . (winheight(0) * 2/3)
    try
      exec "buffer " . s:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
      set nospell nonumber norelativenumber signcolumn=no
    endtry
    startinsert!
    let s:term_win = win_getid()
  endif
endfunction
