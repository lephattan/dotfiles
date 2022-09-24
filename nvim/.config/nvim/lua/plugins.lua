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
  -- use 'szw/vim-maximizer'
  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }

  -- Comment
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
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
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
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

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        theme = 'gruvbox',
      })
    end
  }

  -- Signature
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup()
    end,
  }

  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Indent blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  if packer_bootstrap then
    require('packer').sync()
  end
end)
