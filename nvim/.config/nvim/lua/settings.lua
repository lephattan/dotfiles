-- Vim global options
vim.g.python3_host_prog = vim.call('expand', '~/.envs/nvim/bin/python3')
vim.g.python_highlight_all = 1
vim.g.vimspector_enable_mappings = 'HUMAN'

-- Set vim option
vim.o.syntax = true
vim.opt.number =  true
vim.opt.relativenumber =  true
vim.opt.wrap = false
vim.opt.splitright =  true
vim.opt.splitbelow = true
vim.opt.cursorline =  true
vim.o.completeopt="menuone,noinsert,noselect"

