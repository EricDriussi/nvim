" Built-in Terminal
let g:term_buf = 0
let g:term_win = 0

function! VertTermToggle()
  if win_gotoid(g:term_win)
    hide
  else
    wincmd l
    wincmd l
    vert new
    exec "vertical resize " . (&columns * 2/5)
    try
      exec "buffer " . g:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let g:term_buf = bufnr("")
      set nonumber
      set norelativenumber
      set signcolumn=no
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction

function! HorTermToggle()
  if win_gotoid(g:term_win)
    hide
  else
    botright new
    exec "resize " . (winheight(0) * 2/3)
    try
      exec "buffer " . g:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let g:term_buf = bufnr("")
      set nonumber
      set norelativenumber
      set signcolumn=no
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction
