local keymap = vim.keymap.set
return {
  'mfussenegger/nvim-dap',
  event = "VeryLazy",
  -- lazy = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    "nvim-neotest/nvim-nio",
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Debuggers here:
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dappython = require('dap-python')
    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'python',
      },
    }
    require("nvim-dap-virtual-text").setup({})
    dapui.setup({
      controls = {
        enabled = false,
      },
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.25
        }, {
          id = "breakpoints",
          size = 0.25
        }, {
          id = "stacks",
          size = 0.25
        }, {
          id = "watches",
          size = 0.25
        } },
        position = "left",
        size = 60
      }, {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 15
      } },
    })

    dappython.setup('~/.virtualenvs/debugpy/bin/python')
    dappython.test_runner = 'pytest'
    table.insert(require('dap').configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Run main.py',
      program = 'main.py',
    })

    table.insert(require('dap').configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Python Unittest',
      module = 'unittest',
    })

    table.insert(require('dap').configurations.php, {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug',
      port = 9003,
      pathMappings = {
        ["/var/www/htdocs"] = "${workspaceFolder}"
      },
    })

    table.insert(require('dap').configurations.php, {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug (Local)',
      port = 9003,
      pathMappings = {
        ["/app/public"] = "${workspaceRoot}",
      },
      localSourceRoot = "${workspaceFolder}",
    })

    dap.defaults.fallback.force_external_terminal = true
    vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🟩', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '📄', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

    require('telescope').load_extension('dap')

    -- Mappings
    keymap('n', '<leader>dh', function() require "dap.ui.widgets".hover() end, { desc = "[D]ebug widgets [H]over" })
    keymap('n', '<leader>dc', function()
      require('dap.ext.vscode').load_launchjs();
      dap.continue()
    end, { desc = "[D]ebug [C]ontinue/start" })
    keymap('n', '<leader>dt', function() require "dap".terminate() end, { desc = "[D]ebug [T]erminate session" })
    keymap('n', '<leader>dr', function() require "dap".repl.toggle({}, 'vsplit') end, { desc = "[D]ebug toogle [R]epl" })
    keymap('n', '<leader>dl', function() require "dap".run_last() end, { desc = "[D]ebug run [L]ast" })
    keymap('n', '<leader>du', function() require "dapui".toggle() end, { desc = "[D]ebug toogle [U]I" })
    keymap('n', '<leader>d/', function()
      local widgets = require 'dap.ui.widgets';
      widgets.centered_float(widgets.scopes)
    end, { desc = "[D]ebug [/] floating Scopes" })
    keymap('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle [B]reakpoint" })
    keymap('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      { desc = "Toggle conditional [B]reakpoint" })
    keymap('n', '<leader>lp', function() require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      { desc = "Toggle [L]og [P]oint" })

    -- keymap('n', '<C-k>', function() require 'dap'.step_into() end, { desc = "DAP Step Into" })
    -- keymap('n', '<C-j>', function() require 'dap'.step_over() end, { desc = "DAP Step Over" })
    -- keymap('n', '<C-h>', function() require 'dap'.step_out() end, { desc = "DAP Step Out" })
  end,
}
