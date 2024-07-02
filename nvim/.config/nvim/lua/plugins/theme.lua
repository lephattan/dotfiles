return {
  -- Theme
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
      term_colors = true,
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        fidget = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        markdown = true,
        dap = true,
      },
    })
  end
}
