"Settings/Options
" source ~/.config/nvim/vimscript/setopts.vim
lua require('setopts')
"Basic Keymaps
" source ~/.config/nvim/vimscript/keymaps.vim
lua require('keymap')

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

