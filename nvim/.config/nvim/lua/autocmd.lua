local api = vim.api
local create_autocmd = api.nvim_create_autocmd

api.nvim_create_autocmd(
{'BufNewFile', 'BufRead'}, {
  pattern={'*.py'},
  command=[[
  set tabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix
  nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
  nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
  ]]
})

create_autocmd({'FileType'}, {
  pattern={'vue'},
  command=[[setlocal sts=0 expandtab|set filetype=vue.html]],
})


create_autocmd({'FileType'}, {
  pattern={'php'},
  command=[[setlocal ai si]],
})

