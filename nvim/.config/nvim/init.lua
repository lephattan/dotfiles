
require('helpers')
require('mappings')
require('settings')
require('plugins')

-- Nvim-lsp 
require('nvim-cmp')
local lsp = require 'lsp'
lsp.setup()

-- Activate colorscheme
vim.cmd('colorscheme gruvbox')

