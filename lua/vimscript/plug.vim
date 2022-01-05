call plug#begin('~/.config/nvim/plugged')


"Looks
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
" Theme
Plug 'gruvbox-community/gruvbox'

"Needed for other plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-emoji'

"Undo, File Explorer and auto-comments
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

"Telescope!
Plug 'nvim-telescope/telescope.nvim'
"Make it faster!
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"LSP
Plug 'neovim/nvim-lspconfig'
"Install servers easily
Plug 'williamboman/nvim-lsp-installer'
"Settings made easy
Plug 'tamago324/nlsp-settings.nvim'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"TreeSitter for Highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"GIT
"Git commit like IntelliJ -> Toggleterm + LazyGit
"Plug 'sindrets/diffview.nvim'
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
""Plug 'peitalin/vim-jsx-typescript'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'unblevable/quick-scope'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/which-key.nvim'

call plug#end()

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
