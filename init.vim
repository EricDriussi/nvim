let mapleader = " "
"Plug and generic Plugin settings
source ~/.config/nvim/vimscript/plug.vim
"Script to view a diff of different files given a vsplit
source ~/.config/nvim/vimscript/diffmode.vim
"Script to toggle an IDE like terminal
source ~/.config/nvim/vimscript/terminal.vim
"Settings/Options
source ~/.config/nvim/vimscript/setopts.vim
"Basic Keymaps
source ~/.config/nvim/vimscript/keymaps.vim
"Autosave Sessions (DEPENDS ON notjedi/nvim-rooter.lua)
source ~/.config/nvim/vimscript/sessions.vim
"Toggle Format on save
lua require('format-toggle')

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
autocmd FileType man,harpoon,TelescopePrompt setlocal nospell

"Don't bring comment to new line
autocmd BufWinEnter * set formatoptions-=cro
