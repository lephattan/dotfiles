local gps = require("nvim-gps")
gps.setup()
require("lualine").setup({
  sections = {
    lualine_b = {'branch'},
    lualine_c = {
      'filename',
      { gps.get_location, cond = gps.is_available },
      },
    lualine_x = {'filetype'},
    lualine_y = {'diff', 'diagnostics'},
  },
  inactive_sections = {
    lualine_x = {'encoding', 'fileformat', 'filetype'},
  },
  options = { theme = 'gruvbox' },
})
