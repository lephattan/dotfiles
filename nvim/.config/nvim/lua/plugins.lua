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
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- Git
	use 'tpope/vim-fugitive'

	-- Which key for Mapping management
	use {
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup {
			}
		end
	}

	-- Auto-pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	require("nvim-autopairs").setup {}

	-- Maximizer
	use 'szw/vim-maximizer'
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	
	if packer_bootstrap then
		require('packer').sync()
	end
end)
