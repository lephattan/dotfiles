local keymap_g = {
  g = {
    name = 'Git',
    s = {'<cmd>G<CR>', 'Git status'},
    h = {'<cmd>diffget //3<CR>', 'Diffget 3'},
    u = {'<cmd>diffget //2<CR>', 'Diffget 2'},
  }
}

require('which-key').register(keymap_g, {prefix = '<leader>'})
