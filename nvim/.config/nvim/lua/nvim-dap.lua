local dap = require('dap')
local dapui = require("dapui")
local dappython = require('dap-python')

dapui.setup()
dappython.setup('~/.virtualenvs/debugpy/bin/python')
require("nvim-dap-virtual-text").setup()

table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Python Unittest',
  module = 'unittest',
})

dap.defaults.fallback.force_external_terminal = true
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📄', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  -- dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  -- dapui.close()
end

