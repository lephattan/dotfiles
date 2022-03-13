-- Map leader to space
vim.g.mapleader = ' '


-- Sensible defaults
require 'settings'


-- Plugins with vim-plug
require 'plugins'
-- Activate colorscheme
vim.cmd('colorscheme gruvbox')

-- Nvim-lsp 
local lsp = require 'lsp'
lsp.setup()
require 'lsp_lua'
