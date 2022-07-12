vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true }

keymap('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>m', ':MaximizerToggle<cr>', opts)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap('v', 'A-j', ":m '>+1<CR>gv=gv", opts )
keymap('v', 'A-k', ":m '>-2<CR>gv=gv", opts )

keymap('n', '<leader>5', ':exe "vertical resize ".&columns*1/2<cr>', opts)
keymap('n', '<leader>=', ':resize +5<cr>', opts)
keymap('n', '<leader>-', ':resize -5<cr>', opts)

local fugitive= {
  g = {
    name = 'Git',
    s = {'<cmd>G<CR>', 'Git status'},
    h = {'<cmd>diffget //3<CR>', 'Diffget 3'},
    u = {'<cmd>diffget //2<CR>', 'Diffget 2'},
  }
}

local trouble = {
	x = {
		name = 'Trouble',
		x = {'<cmd>TroubleToggle<cr>', 'Toggle Trouble'},
		w = {'<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle Workspace Trouble'},
		d = {'<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle Document Trouble'},
	},
}

if isModuleAvailable('which-key') then
	local whichKey = require('which-key')
	whichKey.register(fugitive, {prefix = '<leader>'})
	whichKey.register(trouble, {prefix = '<leader>'})
end

