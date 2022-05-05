require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
}

local keymap_x = {
  x = {
    name = 'Trouble',
    x = {'<cmd>TroubleToggle<cr>', 'Toggle Trouble'},
    w = {'<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace Diagnostics'},
    d = {'<cmd>TroubleToggle document_diagnostics<cr>', 'Document Diagnostics'},
    q = {'<cmd>TroubleToggle quickfix<cr>', 'Quickfix'},
    l = {'<cmd>TroubleToggle loclist<cr>', 'Loclist'},
  },
}

if isModuleAvailable('which-key') then
  require('which-key').register(keymap_x, {prefix = '<leader>'})
end
