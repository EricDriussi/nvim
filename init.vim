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

" --------------------------------Plugins vimscript config--------------------------------"

let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark 

"Highlight references for word under cursor
hi! LspReferenceText guibg=#504945
hi! LspReferenceRead guibg=#504945
hi! LspReferenceWrite guibg=#504945

"Too much red...
hi! link Keyword GruvboxAqua
hi! link Include GruvboxRed

" Colorizer
au BufNewFile,BufRead * :ColorizerAttachToBuffer

let g:NERDToggleCheckAllLines = 1

" markdown-preview concrete port
let g:mkdp_port = '6969'

" Quickscope only highlight on keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Thing between editorconfig and fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" FixCursorHold
let g:cursorhold_updatetime = 100

" Surround.vim
vmap ( S)
vmap [ S]
vmap { S}
vmap ' S'
vmap " S"
vmap ` S`
