require('helpers')
require('mappings')
require('settings')
require('plugins')
require('autocmd')

-- Nvim-lsp 
require('nvim-cmp')
local lsp = require('lsp')
lsp.setup()

-- Activate colorscheme
vim.cmd('colorscheme gruvbox')

require('nvim-dap')
require("nvim-autopairs").setup {}
require('Comment').setup()
