" ---------------------------Set up diff view between different files---------------------------"

let g:diffmode = 0
function! DiffMe()
    if g:diffmode == 0
	let g:current_split = win_getid()
	:wincmd h
	diffthis
	:wincmd l
	diffthis
	windo set cursorbind
	windo set scrollbind
	windo set wrap
        let g:diffmode = 1
	call win_gotoid(g:current_split)
    else
        set nocursorbind
        set noscrollbind
        diffoff
        let g:diffmode = 0
    endif
endfunction

nnoremap <leader>d <cmd>call DiffMe()<CR>
