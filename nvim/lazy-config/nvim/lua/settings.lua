local g = vim.g
local o = vim.o
local opt = vim.opt
local api = vim.api

-- Vim global options
g.python3_host_prog = vim.call('expand', '~/.envs/nvim/bin/python3')
g.python_highlight_all = 1
g.indentLine_setConceal = 0
o.clipboard = "unnamedplus"
o.hlsearch = false -- no hightlight on search
o.undofile = true  -- Save undo history
-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
-- Decrease update time
o.updatetime = 250
o.timeout = true
o.timeoutlen = 300
o.termguicolors = true -- NOTE: You should make sure your terminal supports this
-- Snippet
g.UltiSnipsSnippetDirectories = { "UltiSnips", '$HOME/.config/nvim/UltiSnips' }
-- Indent blankline
g.indentLine_fileTypeExclude = { 'startify' }

o.syntax = 'on'
o.signcolumn = 'yes' -- signcolumn always on
opt.fillchars = { eob = ' ' }
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
o.completeopt = "menuone,noselect"
g.startify_lists = {
  { type = 'sessions',  header = { 'Sessions' } },
  { type = 'files',     header = { 'MRU' } },
  { type = 'dir',       header = { 'MRU' .. vim.fn.getcwd() } },
  { type = 'bookmarks', header = { 'Bookmarks' } },
  { type = 'commands',  header = { 'Commands' } },
}
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.smartindent = true
o.mouse = 'a'
o.ph = 10

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
