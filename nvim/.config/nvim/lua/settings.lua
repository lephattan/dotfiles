local g = vim.g
-- Vim global options
vim.g.python3_host_prog = vim.call('expand', '~/.envs/nvim/bin/python3')
vim.g.python_highlight_all = 1
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.indentLine_setConceal = 0
vim.o.clipboard = "unnamedplus"

-- Set vim option
vim.o.syntax = 'on'
vim.o.signcolumn = 'yes'
vim.opt.fillchars = { eob = ' ' }
vim.opt.number =  true
vim.opt.relativenumber =  true
vim.opt.wrap = false
vim.opt.splitright =  true
vim.opt.splitbelow = true
vim.opt.cursorline =  true
vim.o.completeopt="menuone,noinsert,noselect"
g.startify_lists = {
	{type='sessions', header={'Sessions'}},
	{type='files', header= {'MRU'}},
	{type='dir', header={'MRU'..vim.fn.getcwd()}},
	{type='bookmarks', header={'Bookmarks'}},
	{type='commands', header={'Commands'}},
}
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.smartindent = true
vim.o.mouse = nil
vim.o.ph = 10

-- Snippet
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", '$HOME/.config/nvim/UltiSnips' }

-- Indent blankline
vim.g.indentLine_fileTypeExclude = { 'startify' }
