"Settings/Options
source ~/.config/nvim/lua/vimscript/setopts.vim
"Basic Keymaps
source ~/.config/nvim/lua/vimscript/keymaps.vim

"Highlight references for word under cursor
hi! LspReferenceText guibg=#504945
hi! LspReferenceRead guibg=#504945
hi! LspReferenceWrite guibg=#504945

"Too much red...
hi! link Keyword GruvboxAqua
hi! link Include GruvboxRed

"Always check if
autocmd BufEnter * :call SetFiletypeNewBuffer()
"Undefined buffer
function! SetFiletypeNewBuffer()
  if @% == ""
    "And set filetype to none
    :set filetype=none
  endif
endfunction
"Enable spelling for commits and undefined buffers
autocmd FileType gitcommit,none setlocal spell spelllang=es,en

"Don't bring comment to new line
autocmd BufWinEnter * set formatoptions-=cro

