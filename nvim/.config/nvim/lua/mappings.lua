vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
-- keymap('n', '<leader>m', ':MaximizerToggle<cr>', opts)
keymap('n', '<leader>m', '<Cmd>WindowsMaximize<CR>', opts)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap('v', 'A-j', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'A-k', ":m '>-2<CR>gv=gv", opts)

keymap('n', '<leader>5', ':exe "vertical resize ".&columns*1/2<cr>', opts)
keymap('n', '<leader>=', ':resize +5<cr>', opts)
keymap('n', '<leader>-', ':resize -5<cr>', opts)

keymap('i', '<C-c>', '<Esc>', opts)

keymap('t', '<Esc>', '<C-\\><C-n>', opts) -- Exit terminal


vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<leader>fs', function()
  local status, search = pcall(vim.fn.input, "Grep > ");
  if status then
    require('telescope.builtin').grep_string({ search = search });
  end
end)
local default = {
  s = { '<cmd>so ~/.config/nvim/init.lua<CR>', 'Reload Init file' },
}

local fugitive = {
  g = {
    name = 'Git',
    s = { '<cmd>G<CR>', 'Git status' },
    h = { '<cmd>diffget //3<CR>', 'Diffget 3' },
    u = { '<cmd>diffget //2<CR>', 'Diffget 2' },
    l = { '<cmd>G log<cr>', 'Git log' },
  }
}

local trouble = {
  x = {
    name = 'Trouble',
    x = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
    w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle Workspace Trouble' },
    d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle Document Trouble' },
  },
}

local dap_mappings = {
  d = {
    name = 'Debug Adaptor',
    i = { function() require "dap.ui.widgets".hover() end, 'Widgets hover' },
    c = { function()
      require('dap.ext.vscode').load_launchjs();
      local dap = require 'dap';
      dap.continue()
    end, 'Start/Continue debug' },
    t = { function() require 'dap'.terminate() end, 'Terminate Session' },
    r = { function() require 'dap'.repl.toggle({}, 'vsplit') end, 'Toogle Repl' },
    l = { function() require 'dap'.run_last() end, 'Run last' },
    u = { function() require("dapui").toggle() end, 'Toggle UI' },
  },
  b = { function() require('dap').toggle_breakpoint() end, 'Toggle Breakpoint' },
  B = { function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    'Toogle Conditional Breakpoint' },
  lp = { function() require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, 'Set log point' }
}
dap_mappings['d']['/'] = { function()
  local widgets = require 'dap.ui.widgets';
  widgets.centered_float(widgets.scopes)
end, 'Floating scopes' }

local dap_naked_mappings = {}
dap_naked_mappings['<C-j>'] = { function() require 'dap'.step_over() end, 'DAP Step into' }
dap_naked_mappings['<C-k>'] = { function() require 'dap'.step_into() end, 'DAP Step out' }
dap_naked_mappings['<C-h>'] = { function() require 'dap'.step_out() end, 'DAP Step over' }

local telescope = {
  f = {
    name = 'Telescope Find ...',
    f = { '<cmd>Telescope find_files<cr>', 'Find files' },
    -- g = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
    g = {
      name = "Find git",
      b = { '<cmd>Telescope git_branches<cr>', "Find git branches" },
    },
    b = { '<cmd>Telescope buffers<cr>', 'Find in buffers' },
    h = { '<cmd>Telescope help_tags<cr>', 'Find in help tags' },
    t = { '<cmd>TodoTelescope<cr>', 'Find TODOs' },
  }
}

if isModuleAvailable('which-key') then
  local whichKey = require('which-key')
  whichKey.register(fugitive, { prefix = '<leader>' })
  whichKey.register(trouble, { prefix = '<leader>' })
  whichKey.register(dap_mappings, { prefix = '<leader>' })
  whichKey.register(dap_naked_mappings)
  whichKey.register(default, { prefix = '<leader>' })
  whichKey.register(telescope, { prefix = '<leader>' })
end
