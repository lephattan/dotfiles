local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug(
  'prettier/vim-prettier',
  { 
    --['do'] = vim.call('yarn install'),
    ['do'] = 'yarn install',
    ['for'] = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'},
  }
)
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
-- Vim LSP
Plug 'neovim/nvim-lspconfig'
-- Nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
Plug 'nvim-treesitter/playground'
-- ncim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
-- Maximizer
Plug 'szw/vim-maximizer'
-- Trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
-- indentLine
Plug 'Yggdroot/indentLine'
-- Vim Inspector
Plug 'puremourning/vimspector'

-- Toml files syntax
Plug 'cespare/vim-toml'

-- Startup screen
Plug 'mhinz/vim-startify'

-- nvim-gps simple status line component 
-- nvim-treesitter/nvim-treesitter"
Plug 'nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-gps'

-- vim-surround
Plug 'tpope/vim-surround'

-- Emmet
Plug 'mattn/emmet-vim'

Plug 'tjdevries/nlua.nvim'
--Plug 'nvim-lua/completion-nvim'
Plug 'euclidianAce/BetterLua.vim'

-- which-key
Plug 'folke/which-key.nvim'

-- Signature
Plug 'ray-x/lsp_signature.nvim'

vim.call('plug#end')

-- which-key
require("which-key").setup {}
