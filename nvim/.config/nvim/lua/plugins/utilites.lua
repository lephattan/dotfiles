return {
  {
    -- WhichKey
    'folke/which-key.nvim',
    opts = {}
  },
  {
    -- 'jose-elias-alvarez/null-ls.nvim',
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvimtools/none-ls-extras.nvim' },
    config = function()
      local null_ls = require('null-ls')

      local function style50()
        local h = require("null-ls.helpers")
        local methods = require("null-ls.methods")
        local FORMATTING = methods.internal.FORMATTING
        local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

        return h.make_builtin {
          name = "style50_format",
          meta = {},
          method = { FORMATTING, RANGE_FORMATTING },
          filetypes = { "c" },
          generator_opts = {
            command = "clang-format",
            -- args = {
            --   "-style={ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }",
            --   "-assume-filename", "$FILENAME",
            --   "--offset",
            --   "--length",
            -- },
            args = h.range_formatting_args_factory(
              { "-assume-filename", "$FILENAME",
                "-style",
                "{ AllowShortFunctionsOnASingleLine: Empty, BraceWrapping: { AfterCaseLabel: true, AfterControlStatement: true, AfterFunction: true, AfterStruct: true, BeforeElse: true, BeforeWhile: true }, BreakBeforeBraces: Custom, ColumnLimit: 132, IndentCaseLabels: true, IndentWidth: 4, SpaceAfterCStyleCast: true, TabWidth: 4 }" },
              "--offset",
              "--length",
              { use_length = true, row_offset = -1, col_offset = -1 }
            ),
            to_stdin = true,
          },
          factory = h.formatter_factory,
        }
      end

      null_ls.setup({
        sources = {
          require("none-ls.diagnostics.flake8"),
          require("none-ls.code_actions.eslint_d"),
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettierd.with { disabled_filetypes = { 'html' } },
          null_ls.builtins.formatting.black,
          style50,
          -- null_ls.builtins.formatting.biome
        },
      })
    end
  }
}
