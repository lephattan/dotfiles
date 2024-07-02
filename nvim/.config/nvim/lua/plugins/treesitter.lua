return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'nvim-treesitter/nvim-treesitter-context' },
  },
  event = "VeryLazy",
  build = ':TSUpdate',
  config = function()
    local opts = {
      ensure_installed = {
        'arduino',
        'awk',
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gotmpl',
        'gowork',
        'html',
        'htmldjango',
        'ini',
        'javascript',
        'jq',
        'jsdoc',
        'json',
        'json5',
        'jsonnet',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'mermaid',
        'php',
        'php_only',
        'phpdoc',
        'printf',
        'proto',
        'python',
        'regex',
        'rust',
        'scss',
        'ssh_config',
        'svelte',
        'templ',
        'todotxt',
        'toml',
        'tsv',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true,
        disable = { 'python' }
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    }
    require("nvim-treesitter.configs").setup(opts)

    -- Go templ files syntax hightlight
    local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" }
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", }
    }
  end
}
