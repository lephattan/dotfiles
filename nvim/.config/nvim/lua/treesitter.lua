require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  auto_install = true,
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  indent = {
    -- enable = true,
  }
}
