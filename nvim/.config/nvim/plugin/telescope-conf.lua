require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
  },
})
local keymap_f = {
  f = {
    name = 'Telescope',
    f = {'<cmd>Telescope find_files<cr>', 'Find files'},
    g = {'<cmd>Telescope live_grep<cr>', 'Live grep'},
    b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    h = {'<cmd>Telescope help_tags<cr>', 'Help tags'}
  }
}
if isModuleAvailable('which-key') then
  require('which-key').register(keymap_f, {prefix = '<leader>'})
end
