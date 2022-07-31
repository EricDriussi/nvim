"Settings/Options
source ~/.config/nvim/lua/vimscript/setopts.vim
"Basic Keymaps
source ~/.config/nvim/lua/vimscript/keymaps.vim

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
autocmd FileType man setlocal nospell

"Don't bring comment to new line
autocmd BufWinEnter * set formatoptions-=cro

