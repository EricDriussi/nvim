"Settings/Options
" source ~/.config/nvim/vimscript/setopts.vim
lua require('setopts')
"Basic Keymaps
" source ~/.config/nvim/vimscript/keymaps.vim
lua require('keymap')

set nocursorline
set nocursorcolumn
set norelativenumber
set signcolumn=no

syntax sync minlines=200
syntax sync maxlines=500
