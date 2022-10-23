let mapleader = " "
"Plug and generic Plugin settings
source ~/.config/nvim/vimscript/plug.vim
"Script to view a diff of different files given a vsplit
"TODO.vim->lua
source ~/.config/nvim/vimscript/diffmode.vim
"Script to toggle an IDE like terminal
"TODO.rm?
source ~/.config/nvim/vimscript/terminal.vim
"Autosave Sessions (DEPENDS ON notjedi/nvim-rooter.lua)
"TODO.vim->lua && refactor
source ~/.config/nvim/vimscript/sessions.vim
"Mouse Popup Menu
source ~/.config/nvim/vimscript/popup.vim

"Exit Vim meme here
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
