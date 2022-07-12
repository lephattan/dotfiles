vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true }

keymap('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>m', ':MaximizerToggle<cr>', opts)

local fugitive= {
  g = {
    name = 'Git',
    s = {'<cmd>G<CR>', 'Git status'},
    h = {'<cmd>diffget //3<CR>', 'Diffget 3'},
    u = {'<cmd>diffget //2<CR>', 'Diffget 2'},
  }
}

if isModuleAvailable('which-key') then
  require('which-key').register(fugitive, {prefix = '<leader>'})
end

