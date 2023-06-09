local api = vim.api

api.nvim_set_hl(0, "ColorColumn", { bg = '#754C00' })                 -- Color column BG
api.nvim_set_hl(0, "ExtraWhitespace", { bg = 'red' })                 -- Extra white space warning
api.nvim_set_hl(0, 'FloatBorder', { bg = '#3B4252', fg = '#5E81AC' }) -- Default float border color
api.nvim_set_hl(0, 'NormalFloat', { bg = '#3B4252' })                 -- default float win bg
