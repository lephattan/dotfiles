local dap = require('dap')
local dapui = require("dapui")
local dappython = require('dap-python')

dapui.setup({
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
require("nvim-dap-virtual-text").setup()
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
require("rust-dap")

dap.defaults.fallback.force_external_terminal = true
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🟩', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📄', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  -- dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  -- dapui.close()
end
