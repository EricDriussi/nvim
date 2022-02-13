let mapleader = " "
"Plug and generic Plugin settings
source ~/.config/nvim/lua/vimscript/plug.vim
"Script to view a diff of different files given a vsplit
source ~/.config/nvim/lua/vimscript/diffmode.vim
"Script to toggle an IDE like terminal
source ~/.config/nvim/lua/vimscript/terminal.vim

lua << EOF
    -- Completion
    require("plugins-config.cmp")
    -- LSP
    require("plugins-config.lsp")
    -- Telescopic
    require("plugins-config.telescope")
    -- Treesitter
    require("plugins-config.treesitter")
    -- Gitsigns
    require("plugins-config.gitsigns")
    -- ToggleTerm
    require("plugins-config.toggleterm")
    -- WhichKey
    require("plugins-config.which-key")
    -- NvimTree
    require("plugins-config.nvim-tree")
    -- Autopairs
    require("plugins-config.autopairs")
    -- Null-ls
    require("plugins-config.null-ls")
EOF

"Settings
"filetype plugin indent on
set ignorecase
set smartcase
"set spelllang=en,es,cjk
"set spell
set nospell
set encoding=utf-8
set fileencoding=utf-8
set updatetime=200
set timeoutlen=500
set noerrorbells
set number relativenumber
set mouse=a
set hidden
set termguicolors
set wrap
set incsearch
"set cursorline
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
set scrolloff=8
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
set softtabstop=2
set expandtab
set shiftwidth=4
set smartindent

set completeopt="menuone, noselect"
set pumheight=10
set signcolumn=yes
set numberwidth=4
set conceallevel=0

"Highlight references for word under cursor
hi! LspReferenceText guibg=#504945
hi! LspReferenceRead guibg=#504945
hi! LspReferenceWrite guibg=#504945
"Too much red...
hi! link Keyword GruvboxAqua
hi! link Include GruvboxRed

" --------------------------------Keymap--------------------------------"
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

"Add Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"Add number and half page jumps to jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <c-u> <c-u>m'
nnoremap <c-d> <c-d>m'


" --------------------------------Plugins--------------------------------"

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
vmap ` S`

"md-preview
nnoremap <leader>m <cmd>MarkdownPreviewToggle<cr>

"Fugitive Split
nnoremap <leader>gs <cmd>Gvdiffsplit<bar>windo set wrap<CR>
"Fugitive Blame
nnoremap <leader>gL <cmd>Git blame<CR>

"Gitsigns!
nnoremap <leader>gb <cmd>Gitsigns reset_hunk<CR>
nnoremap <leader>gl <cmd>Gitsigns toggle_current_line_blame<CR>

"SML REPL
nnoremap <leader>s :SMLReplStop<CR>:SMLReplStart<CR>:wincmd l<cr>

"ToggleTerm
nnoremap <a-s> <cmd>lua _SML_TOGGLE()<CR>
nnoremap <a-g> <cmd>lua _LAZYGIT_TOGGLE()<CR>
nnoremap <a-n> <cmd>lua _NODE_TOGGLE()<CR>

"Telescope
nnoremap <leader>f <cmd>Telescope git_files<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>
"Display all commands (Actions)
nnoremap <leader>A <cmd>Telescope commands<cr>
"Display reg
nnoremap <leader>R <cmd>Telescope registers<cr>
"Super-Find anywhere
nnoremap <Leader>sf <cmd>Telescope find_files<CR>
"Code actions made pretty
nnoremap <A-CR> <cmd>Telescope lsp_code_actions<cr>
nnoremap <C-Space> <cmd>Telescope spell_suggest<cr>

"Format Null-ls
nnoremap <leader>l <cmd>lua vim.lsp.buf.formatting_sync()<CR>
"Diagnostics Null-ls
"Possible issues since overrides keymap in LSP-handlers
nnoremap ge <cmd>lua vim.diagnostic.open_float()<CR>

"Refactor!
"vnoremap <Leader>re <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]]
"vnoremap <Leader>rf <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>
"vnoremap <Leader>rv <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>
"vnoremap <Leader>ri <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>

lua << EOF
-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

EOF
