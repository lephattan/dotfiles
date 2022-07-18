-- Call Lua Modules
require('helpers')
require('mappings')
require('settings')
require('plugins')
require('autocmd')
require('treesitter')

-- Nvim-lsp 
require('nvim-cmp')
local lsp = require('lsp')
lsp.setup()

-- Activate colorscheme
vim.cmd('colorscheme gruvbox')
vim.cmd('highlight Normal ctermbg=none guibg=none')
vim.cmd('highlight NonText ctermbg=none guibg=none')
