" Auto install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/.plugged')

Plug 'EricDriussi/aucmd-toggle.nvim'

" Winbar
Plug 'fgheng/winbar.nvim'
" Status Line
Plug 'nvim-lualine/lualine.nvim'
" Color on hex Codes
Plug 'norcalli/nvim-colorizer.lua'
" Intend Line
Plug 'lukas-reineke/indent-blankline.nvim'
" Theme
Plug 'sainnhe/gruvbox-material', {'commit': '421ccc28df2b5c8aef06b40160d539684fd1e771'}
" Pretty QFList
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
" Highlight elements
Plug 'RRethy/vim-illuminate'

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
" f to char
Plug 'unblevable/quick-scope'
" Handle camelCase and snek_case
Plug 'chaoren/vim-wordmotion'
" Improve speed
Plug 'lewis6991/impatient.nvim'
" Jump between files
Plug 'ThePrimeagen/harpoon'
" Seek & Destroy
Plug 'windwp/nvim-spectre'
" Misc
Plug 'jltwheeler/nvim-git-link'
Plug 'gaoDean/autolist.nvim'
Plug 'xorid/swap-split.nvim'
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/which-key.nvim'
Plug 'editorconfig/editorconfig-vim'

" --------------------------------LSP-STUFF--------------------------------"

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Completion and sources
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Install LSP tools easily
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

" Jsonls stuff
Plug 'b0o/SchemaStore.nvim'
" Formatting and LSP like stuff for non-lsp langs
Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()
