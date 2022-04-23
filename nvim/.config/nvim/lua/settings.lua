-- Vim global options
vim.g.python3_host_prog = vim.call('expand', '~/.envs/nvim/bin/python3')
vim.g.python_highlight_all = 1
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.o.clipboard = "unnamedplus"

-- Set vim option
vim.o.syntax = true
vim.o.signcolumn = 'yes'
vim.opt.number =  true
vim.opt.relativenumber =  true
vim.opt.wrap = false
vim.opt.splitright =  true
vim.opt.splitbelow = true
vim.opt.cursorline =  true
vim.o.completeopt="menuone,noinsert,noselect"


