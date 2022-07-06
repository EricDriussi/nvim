call plug#begin('~/.config/nvim/.plugged')

" Tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Status Line
Plug 'nvim-lualine/lualine.nvim'
" Color on hex Codes
Plug 'norcalli/nvim-colorizer.lua'
" Intend Line
Plug 'lukas-reineke/indent-blankline.nvim'
" Theme
Plug 'gruvbox-community/gruvbox'
" Pretty QFList
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'

" Undo
Plug 'mbbill/undotree'
" File Explorer
Plug 'kyazdani42/nvim-tree.lua'
" Fix root dir for ⬆️ (also used in sessions.vim)
Plug 'notjedi/nvim-rooter.lua'

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
" Autocomment
Plug 'preservim/nerdcommenter'
" Jump between files
Plug 'ThePrimeagen/harpoon'
" Seek & Destroy
Plug 'windwp/nvim-spectre'

" --------------------------------LSP-STUFF--------------------------------"

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Completion and sources
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-emoji'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'kdheepak/cmp-latex-symbols'

" Snippets in cmp
Plug 'L3MON4D3/LuaSnip'
" Generic snippets
Plug 'rafamadriz/friendly-snippets'

" LSP
Plug 'neovim/nvim-lspconfig'
" Install servers easily
Plug 'williamboman/nvim-lsp-installer'
" Jsonls stuff
Plug 'b0o/SchemaStore.nvim'
" Formatting and LSP like stuff for non-lsp langs
Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()

" Plugins lua config
lua require('plugins-config')
