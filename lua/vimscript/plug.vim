call plug#begin('~/.config/nvim/plugged')

" Tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Status Line
Plug 'nvim-lualine/lualine.nvim'
" Color on hex codes
Plug 'chrisbra/Colorizer'
" Intend Line
Plug 'lukas-reineke/indent-blankline.nvim'
" Theme
Plug 'gruvbox-community/gruvbox'

" Undo
Plug 'mbbill/undotree'
" File Explorer
Plug 'kyazdani42/nvim-tree.lua'
" Autocomment
Plug 'preservim/nerdcommenter'

" Telescope!
Plug 'nvim-telescope/telescope.nvim'
" Also for core nvim stuff
Plug 'nvim-telescope/telescope-ui-select.nvim'
" Make it faster!
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" GIT
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Parenthesis and such
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
Plug 'p00f/nvim-ts-rainbow'

" Needed for other plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Multi-Cursor
Plug 'mg979/vim-visual-multi'
" MD Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" f to char
Plug 'unblevable/quick-scope'
" Integrated terminal
Plug 'akinsho/toggleterm.nvim'
" Bottom menu
Plug 'folke/which-key.nvim'
" Follow editorconfig
Plug 'editorconfig/editorconfig-vim'
" Usually doesn't work
Plug 'ThePrimeagen/refactoring.nvim'
" Launch tests
Plug 'vim-test/vim-test'
" Handle camelCase and snek_case
Plug 'chaoren/vim-wordmotion'
" Improve speed
Plug 'lewis6991/impatient.nvim'
" Fix bug
Plug 'antoinemadec/FixCursorHold.nvim'

" --------------------------------LSP-STUFF--------------------------------"

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Completion and sources
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-emoji'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'kdheepak/cmp-latex-symbols'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP
Plug 'neovim/nvim-lspconfig'
" Install servers easily
Plug 'williamboman/nvim-lsp-installer'
" Settings made easy
Plug 'tamago324/nlsp-settings.nvim'
" Formatting and LSP like stuff for non-lsp langs
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
    -- Lualine
    require("plugins-config.lualine")
    -- Bufferline
    require("plugins-config.bufferline")
EOF

" --------------------------------Plugins vimscript config--------------------------------"

let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark 
au BufEnter * :ColorHighlight<CR>

let g:NERDToggleCheckAllLines = 1

" markdown-preview concrete port
let g:mkdp_port = '6969'

" Quickscope only highlight on keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Thing between editorconfig and fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" FixCursorHold
let g:cursorhold_updatetime = 100

" --------------------------------Plugins keymaps--------------------------------"

" Surround.vim
vmap ( S)
vmap [ S]
vmap { S}
vmap ' S'
vmap " S"
vmap ` S`
