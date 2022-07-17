local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }

  use 'morhetz/gruvbox'
  -- LSP
  use 'neovim/nvim-lspconfig'
  --CMP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { 'ray-x/cmp-treesitter' },
    },
  }
  -- Git
  use 'tpope/vim-fugitive'

  -- Which key for Mapping management
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup { }
    end
  }

  -- Auto-pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Maximizer
  use 'szw/vim-maximizer'

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Start screen
  use 'mhinz/vim-startify'

  -- Troble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  }

  -- Debug Adapter
  use {'mfussenegger/nvim-dap',
  requires = {
    'mfussenegger/nvim-dap-python',
    }
  }

  -- Snippets
  use {
    'SirVer/ultisnips',
    requires = 'quangnguyen30192/cmp-nvim-ultisnips'
  }
  -- Surround 
  use 'tpope/vim-surround'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter
  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate', 
    requires = {
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      {'nvim-treesitter/nvim-treesitter-context'},
    }
  }
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins

if packer_bootstrap then
  require('packer').sync()
end
end)
