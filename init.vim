let mapleader = " "
"Plug and generic Plugin settings
source ~/.config/nvim/lua/vimscript/plug.vim
"Script to view a diff of different files given a vsplit
source ~/.config/nvim/lua/vimscript/diffmode.vim
"Script to toggle an IDE like terminal
source ~/.config/nvim/lua/vimscript/terminal.vim

lua << EOF
    -- Completion settings
    require("plugins-config.cmp")
    -- LSP settings
    require("plugins-config.lsp")
    -- Telescopic settings
    require("plugins-config.telescope")
    -- Treesitter settings
    require("plugins-config.treesitter")
    -- Gitsigns settings
    require("plugins-config.gitsigns")
    -- ToggleTerm
    require("plugins-config.toggleterm")
    -- WhichKey
    require("plugins-config.which-key")
    -- Comment
    require("plugins-config.comment")
EOF

"Settings
filetype plugin indent on
set ignorecase
set smartcase
set spelllang=en,es,cjk
set spell
set encoding=utf-8
set fileencoding=utf-8
set updatetime=200
set timeoutlen=500
set noerrorbells
set number relativenumber
set mouse=a
set hidden
"set termguicolors
set wrap
set incsearch
set cursorline
set splitright
set splitbelow
"Snek case...
set iskeyword-=_
set iskeyword-=-
"Don't comment on CR
set formatoptions-=cor
"Lightline already shows mode
set noshowmode
"Breathing space
set scrolloff=10
set sidescrolloff=5
"Avoid splitting words when wrapping lines
set linebreak
"Set title to current file instead of terminal emulator name
set title
"History
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
"Tab be gud
set autoindent
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent

set completeopt="menuone, noselect"
set pumheight=10
set signcolumn=yes
set numberwidth=4
set conceallevel=0

"Keymaps
"SML REPL
nnoremap <leader>s :SMLReplStop<CR>:SMLReplStart<CR>:wincmd l<cr>

"Kinda scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Sensible copy-pasting to and from system clipboard
vnoremap <C-y> "+y <bar> :echom 'Copied to system clipboard!'<CR>
nnoremap <C-y> "+yiw <bar> :echom 'Copied to system clipboard!'<CR>
nnoremap <C-p> "+p <bar> :echom 'Pasted from system clipboard!'<CR>
vnoremap <C-p> "+p <bar> :echom 'Pasted from system clipboard!'<CR>
inoremap <C-p> <Esc>"+p <bar> :echom 'Pasted from system clipboard!'<CR>A

"Y like you V or C
nnoremap Y y$

"Paste over selected text without screwing the reg
vnoremap p "_dP
vnoremap P "_dP

"Select all
nnoremap <C-a> ggVG

"Increment number
nnoremap <A-a> <C-a>

"Esc+Esc to turn off search highlighting
nnoremap <Esc> :noh<return><Esc>

"Center search selection
nnoremap n nzzzv
nnoremap N Nzzzv

"Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"Dumb-replace word in Normal mode and selection in Visual mode
nnoremap <silent> rp *``cgn
vnoremap <silent> rp y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn
"FUCKS UP REG

"Close tab
nnoremap <C-w> :q<CR>

"Indent
vnoremap <a-h> <gv
vnoremap <a-l> >gv
vnoremap < <gv
vnoremap > >gv
nnoremap <a-h> <<
nnoremap <a-l> >>

"Move current line and selected lines
noremap <a-j> :m .+1<cr>==
noremap <a-k> :m .-2<cr>==
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

"Save all 
nnoremap <C-s> :wa <CR>

"Resize vertical splits
nnoremap + :vertical resize +2<CR>
nnoremap - :vertical resize -2<CR>

"Navigate splits
nnoremap <C-M-l> <cmd>wincmd l<cr>
nnoremap <C-M-h> <cmd>wincmd h<cr>
nnoremap <C-M-j> <cmd>wincmd j<cr>
nnoremap <C-M-k> <cmd>wincmd k<cr>

"Home made auto-pairs
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O<Tab>
inoremap [ []<Left>
inoremap < <><Left>
"inoremap ' ''<Left>
inoremap " ""<Left>

"Add Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"Add number and half page jumps to jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <c-u> <c-u>m'
nnoremap <c-d> <c-d>m'


" ------------------------------MAPPINGS-Plugins------------------------------"

"UndoTree
nnoremap <leader>u <cmd>UndotreeToggle<CR>

"NvimTree
nnoremap <leader>e <cmd>NvimTreeToggle<CR>

"NerdCommenter
nmap <leader>/ <plug>NERDCommenterToggle<CR>k
vmap <leader>/ <plug>NERDCommenterToggle<CR>k

"Surround.vim
vmap ( S)
vmap [ S]
vmap { S}
vmap ' S'
vmap " S"
vmap * S*
vmap ` S`

"md-preview
nnoremap <leader>m <cmd>MarkdownPreviewToggle<cr>

"Fugitive Split
nnoremap <leader>gs <cmd>Gvdiffsplit<bar>windo set wrap<CR>
"Fugitive Blame
nnoremap <leader>gL <cmd>Git blame<CR>

"Emulate IntelliJ Ctrl-K with diffview.nvim
"nnoremap <C-k> <cmd>DiffviewOpen<cr>

"Gitsigns!
nnoremap <leader>gb <cmd>Gitsigns reset_hunk<CR>
nnoremap <leader>gl <cmd>Gitsigns toggle_current_line_blame<CR>

"ToggleTerm
nnoremap <leader>tt <cmd>ToggleTerm<CR>
nnoremap <leader>ts <cmd>lua _SML_TOGGLE()<CR>
nnoremap <leader>tg <cmd>lua _LAZYGIT_TOGGLE()<CR>
nnoremap <leader>td <cmd>lua _LAZYDOCKER_TOGGLE()<CR>

"Telescope
nnoremap <leader>f <cmd>Telescope git_files<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>
"Display all commands (Actions)
nnoremap <leader>A <cmd>Telescope commands<cr>
"Display reg
nnoremap <leader>r <cmd>Telescope registers<cr>
"Super-Find anywhere
nnoremap <Leader>sf <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/" }<CR>
"nnoremap <leader>sf <cmd>Telescope find_files<cr>
"Code actions made pretty
nnoremap <A-CR> <cmd>Telescope lsp_code_actions<cr>
nnoremap <C-Space> <cmd>Telescope spell_suggest<cr>

" ---------------------------nvim.tree---------------------------"

let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw       = true,
    filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache' },
    },
    open_on_tab         = false,
    disable_netrw       = true,
    hijack_netrw        = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    view = {
        mappings = {
            list = {
                { key = "l",              cb = tree_cb("edit") },
                { key = "<C-H>", 	        cb = tree_cb("toggle_dotfiles") },
                { key = "<C-h>",          cb = tree_cb("split") },
                { key = "<C-v>",          cb = tree_cb("vsplit") },
                { key = "R",              cb = tree_cb("refresh") },
                { key = "a",              cb = tree_cb("create") },
                { key = "d",              cb = tree_cb("remove") },
                { key = "y",              cb = tree_cb("copy") },
                { key = "h",              cb = tree_cb("close_node") },
            }
        },
    }
}
EOF

" ---------------------------diffview.nvim---------------------------"

"lua <<EOF
"local cb = require'diffview.config'.diffview_callback

"require'diffview'.setup {
    "key_bindings = {
        "disable_defaults = false,
        "view = {
              "["gf"]    = cb("goto_file_tab"),
        "}
    "}
"}
"EOF
