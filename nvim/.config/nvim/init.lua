-- Map leader to space
vim.g.mapleader = ' '


-- Sensible defaults
require 'settings'


-- Plugins with vim-plug
require 'plugins'
-- Activate colorscheme
vim.cmd('colorscheme gruvbox')

-- Nvim-lsp 
require 'lsp'
require 'lsp_lua'
