local dap = require('dap')
dap.defaults.fallback.force_external_terminal = true
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📄', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

require('dap.ext.vscode').load_launchjs()

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
