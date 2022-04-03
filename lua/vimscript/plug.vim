call plug#begin('~/.config/nvim/plugged')

"Looks
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
" Theme
Plug 'gruvbox-community/gruvbox'

"Undo, File Explorer and auto-comments
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdcommenter'

"Telescope!
Plug 'nvim-telescope/telescope.nvim'
"Make it faster!
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"GIT
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Parenthesis and such
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'p00f/nvim-ts-rainbow'

"MISC
"Multi-Cursor
Plug 'mg979/vim-visual-multi'
Plug 'jez/vim-better-sml'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'unblevable/quick-scope'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/which-key.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ThePrimeagen/refactoring.nvim'

"Needed for other plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" --------------------------------LSP-STUFF--------------------------------"

"TreeSitter for Highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-emoji'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"LSP
Plug 'neovim/nvim-lspconfig'
"Install servers easily
Plug 'williamboman/nvim-lsp-installer'
"Settings made easy
Plug 'tamago324/nlsp-settings.nvim'
"Formatting and LSP like stuff for non-lsp langs
Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()

" --------------------------------Plugins lua config--------------------------------"

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

" --------------------------------Plugins vimscript config--------------------------------"

let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark 

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
			\ 						[ 'gitbranch'] ],
			\
			\ 	'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:NERDToggleCheckAllLines = 1

" SML REPL!
let g:sml_smlnj_executable = '/usr/bin/smlnj'

" markdown-preview concrete port
let g:mkdp_port = '6969'

" Quickscope only highlight on keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Thing between editorconfig and fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" --------------------------------Plugins keymaps--------------------------------"

"Surround.vim
vmap ( S)
vmap [ S]
vmap { S}
vmap ' S'
vmap " S"
vmap ` S`

"SML REPL
nnoremap <leader>s :SMLReplStop<CR>:SMLReplStart<CR>:wincmd l<cr>

"Telescope
nnoremap <Leader>sf <cmd>Telescope find_files<CR>
