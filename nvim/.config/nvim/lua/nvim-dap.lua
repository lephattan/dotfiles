local dap = require('dap')
local dapui = require("dapui")
local dappython = require('dap-python')
-- require('dap.ext.vscode').load_launchjs()

dapui.setup()
dappython.setup('~/.virtualenvs/debugpy/bin/python')

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
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

